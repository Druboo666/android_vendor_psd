#!/bin/bash

#
# Created by Michael S Corigliano for Team AOSPAL (michael.s.corigliano@gmail.com)
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

# Get build version
   PA_MAJOR=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MAJOR := *' | sed  's/ROM_VERSION_MAJOR := //g')
   PA_MINOR=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MINOR := *' | sed  's/ROM_VERSION_MINOR := //g')
   PA_MAINTENANCE=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MAINTENANCE := *' | sed  's/ROM_VERSION_MAINTENANCE := //g')
   PA_TAG=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_TAG := *' | sed  's/ROM_VERSION_TAG := //g')

   PSD_MAJOR=$(cat $DIR/vendor/psd/vendor.mk | grep 'PSD_VERSION_MAJOR := *' | sed  's/PSD_VERSION_MAJOR := //g')
   PSD_MINOR=$(cat $DIR/vendor/psd/vendor.mk | grep 'PSD_VERSION_MINOR := *' | sed  's/PSD_VERSION_MINOR := //g')
   PSD_MAINTENANCE=$(cat $DIR/vendor/psd/vendor.mk | grep 'PSD_VERSION_MAINTENANCE := *' | sed  's/PSD_VERSION_MAINTENANCE := //g')
   PSD_TAG=$(cat $DIR/vendor/psd/vendor.mk | grep 'PSD_TYPE := *' | sed  's/PSD_TYPE := //g')

   if [ -n "$PA_TAG" ]; then
      VERSION=$MAJOR.$MINOR$MAINTENANCE-$TAG
   else
      VERSION=$MAJOR.$MINOR$MAINTENANCE
   fi

   if [ -n "$PSD_TAG" ]; then
      PSD_VERSION=$PSD_MAINTENANCE-$PSD_TAG-$PSD_MAJOR.$PSD_MINOR
   else
      PSD_VERSION=$PSD_MAINTENANCE-$PSD_MAJOR.$PSD_MINOR
   fi

DEVICE="$1"
 
# start
   echo -e "";
   echo -e "";
   echo -e "Building Paranoid SaberDroid for";
   echo -e "$PA_TAG $PA_MAJOR.$PA_MINOR";
   echo -e "$PSD_TAG $PSD_MAJOR.$PSD_MINOR for $DEVICE";
   echo -e "";
   echo -e ""
 
# make 'build-logs' directory if it doesn't already exist
   echo -e "Making a 'build-logs' directory if you haven't already...";
   mkdir -p build-logs
 
# fetch latest sources
   echo -e "";
   echo -e "";
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
   echo -e "";
   echo -e "";
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
   echo -e "";
   echo -e "";
   echo -e "Setting up build environment..."
   . build/envsetup.sh
   clear

# decide to build odex or deodex
   echo -e "";
   echo -e "";
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
   echo -e "";
   echo -e "";
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
         clear
 
# we're done
   echo -e "";
   echo -e "";
   echo -e "Finished building Paranoid SaberDroid.";
   echo -e "If for some reason your build failed,";
   echo -e "please check the 'build-logs' directory to figure out why.";
   echo -e "";
   echo -e ""
