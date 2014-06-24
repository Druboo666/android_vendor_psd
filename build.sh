#!/bin/bash

#
# Implemented by Michael S Corigliano for Team AOSPAL (michael.s.corigliano@gmail.com)
#
# Parts of the original AOSPA build script have also been implemented in this script,
# it can be found here: https://www.github.com/AOSPA/android_vendor_pa/build.sh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# We don't allow scrollback buffer
echo -e '\0033\0143'
clear

# Prepare output customization commands
   red=$(tput setaf 1)             #  red
   grn=$(tput setaf 2)             #  green
   blu=$(tput setaf 4)             #  blue
   cya=$(tput setaf 6)             #  cyan
   txtbld=$(tput bold)             # Bold
   bldred=${txtbld}$(tput setaf 1) #  red
   bldgrn=${txtbld}$(tput setaf 2) #  green
   bldblu=${txtbld}$(tput setaf 4) #  blue
   bldcya=${txtbld}$(tput setaf 6) #  cyan
   txtrst=$(tput sgr0)             # Reset

# if there is more than one jdk installed, use latest 6.x
   if [ "`update-alternatives --list javac | wc -l`" -gt 1 ]; then
      JDK6=$(dirname `update-alternatives --list javac | grep "\-6\-"` | tail -n1)
      JRE6=$(dirname ${JDK6}/../jre/bin/java)
      export PATH=${JDK6}:${JRE6}:$PATH
   fi
   JVER=$(javac -version  2>&1 | head -n1 | cut -f2 -d' ')

# definitions
DEVICE="$1"
timestamp="$(date +%s)"

# Get start time
res1=$(date +%s.%N)
 
# start
   echo -e "Building Paranoid SaberDroid for $DEVICE";
   echo -e "$(date)";
   echo -e ""
 
# make 'build-logs' directory if it doesn't already exist
   echo -e "Making a 'build-logs' directory if you haven't already...";
   mkdir -p build-logs
 
# fetch latest sources
   echo -e "Fetching latest sources...";
   echo "Please select how many threads you would like to use to sync source:
         1) -j4
         2) -j8
         3) -j16
         4) -j32
         5) Don't sync"
      read n
         case $n in
            1) repo sync -j4
               ;;
            2) repo sync -j8
               ;;
            3) repo sync -j16
               ;;
            4) repo sync -j32
               ;;
            5) echo -e "Not syncing"
               ;;
            *) invalid option
               ;;
         esac
         clear

# Decide whether to build clean or dirty
   echo "Build clean or dirty:
         1) clean
         2) dirty"
      read n
         case $n in
            1) make clean
               ;;
            2) echo -e "Building dirty..."
               ;;
            *) invalid option
               ;;
         esac
         clear
 
# invoke the environment setup script to start the building process
   echo -e "Setting up build environment..."
   . build/envsetup.sh
   clear

# decide to build odex or deodex
   echo "Build odex or deodex:
         1) odex
         2) deodex"
      read n
         case $n in
            1) lunch psd_$DEVICE-user
               ;;
            2) lunch psd_$DEVICE-userdebug
               ;;
            *) invalid option
               ;;
         esac
         clear
 
# execute the build while sending a log to 'build-logs'
   echo -e "Starting build...";
   echo "Please select how many threads you would like to use to build:
         1) -j4
         2) -j8
         3) -j18
         4) -j32"
      read n
         case $n in
            1) make -j4 bacon 2>&1 | tee build-logs/psd_$DEVICE-$(date).txt
               ;;
            2) make -j8 bacon 2>&1 | tee build-logs/psd_$DEVICE-$(date).txt
               ;;
            3) make -j18 bacon 2>&1 | tee build-logs/psd_$DEVICE-$(date).txt
               ;;
            4) make -j32 bacon 2>&1 | tee build-logs/psd_$DEVICE-$(date).txt
               ;;
            *) invalid option
               ;;
         esac
 
# we're done
# Get elapsed time
res2=$(date +%s.%N)
   echo -e "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)${txtrst}"
   echo -e "Finished building Paranoid SaberDroid.";
   echo -e "If for some reason your build failed,";
   echo -e "please check the 'build-logs' directory to figure out why.";
   echo -e "";
   echo -e ""
