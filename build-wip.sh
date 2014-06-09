#!/bin/bash

# WIP!!
# crudely written by Michael S Corigliano (MikeCriggs) for Team AOSPAL
# parts of this script have been adapted from AOSPA, credits to the PA team for their work

# get PA build version
   PA_MAJOR=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MAJOR := *' | sed  's/ROM_VERSION_MAJOR := //g')
   PA_MINOR=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MINOR := *' | sed  's/ROM_VERSION_MINOR := //g')
   PA_MAINTENANCE=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_MAINTENANCE := *' | sed  's/ROM_VERSION_MAINTENANCE := //g')
   PA_TAG=$(cat $DIR/vendor/pa/vendor.mk | grep 'ROM_VERSION_TAG := *' | sed  's/ROM_VERSION_TAG := //g')

# get PSD build version
   PSD_MAJOR=$(cat $DIR/vendor/psd/vendor.mk | grep 'PSD_VERSION_MAJOR := *' | sed  's/PSD_VERSION_MAJOR := //g')
   PSD_MINOR=$(cat $DIR/vendor/psd/vendor.mk | grep 'PSD_VERSION_MINOR := *' | sed  's/PSD_VERSION_MINOR := //g')
   PSD_MAINTENANCE=$(cat $DIR/vendor/psd/vendor.mk | grep 'PSD_VERSION_MAINTENANCE := *' | sed  's/PSD_VERSION_MAINTENANCE := //g')
   PSD_TAG=$(cat $DIR/vendor/psd/vendor.mk | grep 'PSD_TYPE := *' | sed  's/PSD_TYPE := //g')

# PA
   if [ -n "$PA_TAG" ]; then
      VERSION=$MAJOR.$MINOR$MAINTENANCE-$TAG
   else
      VERSION=$MAJOR.$MINOR$MAINTENANCE
   fi

# PSD
   if [ -n "$PSD_TAG" ]; then
      PSD_VERSION=$PSD_MAINTENANCE-$PSD_TAG-$PSD_MAJOR.$PSD_MINOR
   else
      PSD_VERSION=$PSD_MAINTENANCE-$PSD_MAJOR.$PSD_MINOR
   fi

DEVICE="$1"
ODEX="$2"
CLEAN="$3"
# to do: sync and build threads
#UPLOAD="$5"

# WIP
# server upload
# SERVER1="/home/www/devs/AOSPAL/download/$DEVICE"
# SERVER2="~/upload/$DEVICE"
 
# start
   echo -e "Building Paranoid SaberDroid for $DEVICE";
   echo -e "Building AOSPAL $PSD_TAG $PSD_MAJOR.$PSD_MINOR for $DEVICE";
   echo -e "$Start time: $(date)"
 
# make 'build-logs' directory if it doesn't already exist
   echo -e "Making a 'build-logs' directory if you haven't already..."
   mkdir -p build-logs
 
# fetch latest sources
   echo -e "Fetching latest sources..."
   repo sync -j32
 
# clear output
   tput clear
 
# clean build directory
   if [ $CLEAN = "clean" ]; then
      echo -e "Cleaning build directory..."
      make clean
   else
      echo -e "Building dirty..."
   fi
 
# clear output
   tput clear
 
# invoke the environment setup script to start the building process
   echo -e "Setting up build environment..."
   . build/envsetup.sh
 
# clear output
   tput clear
 
# specify what device to build and fetch it's dependencies
   echo -e "Eating lunch, brb..."
   if [ $ODEX = "odex" ]; then
      lunch psd_$DEVICE-user
   else
      echo -e "Building deodex..."
      lunch psd_$DEVICE-userdebug
   fi
 
# clear output
   tput clear
 
# execute the build while sending a log to 'build-logs'
   echo -e "Starting build..."
   make -j18 bacon 2>&1 | tee build-logs/psd_$DEVICE-$(date +%s.%N).txt
 
# clear output
   tput clear

# WIP
# copy the finished build & md5sum to the APACHE server
#   echo -e "Copying your build & md5sum to the APACHE server..."
#   if [ $UPLOAD = "server2" ]; then
#      cp out/target/product/$DEVICE/psd_* $SERVER1
#   elif [ $UPLOAD = "server2" ]; then
#      cp out/target/product/$DEVICE/psd_* $SERVER2
#   else
#      echo -e "Not copying to any APACHE servers"
#   fi
 
# clear output
   tput clear
 
# we're done
   echo -e "Finished building Paranoid SaberDroid. If for some reason your build failed, please check the 'build-logs' directory to figure out why."
