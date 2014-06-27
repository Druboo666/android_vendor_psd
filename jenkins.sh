#!/bin/bash
 
usage()
{
echo -e ""
echo -e ${txtbld}"Usage:"${txtrst}
echo -e " rom-build.sh [options] device"
echo -e ""
echo -e ${txtbld}" Options:"${txtrst}
echo -e " -c# Cleaning options before build:"
echo -e " 1 - make clean"
echo -e " 2 - make dirty"
echo -e " -d Use dex optimizations"
echo -e " -j# Set jobs"
echo -e " -s Sync before build"
echo -e ""
echo -e ${txtbld}" Example:"${txtrst}
echo -e " ./rom-build.sh -c1/2 -d -s -j# hammerhead"
echo -e ""
exit 1
}
 
# figure out the output directories
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
thisDIR="${PWD##*/}"
 
findOUT() {
if [ -n "${OUT_DIR_COMMON_BASE+x}" ]; then
return 1; else
return 0
fi;}
 
findOUT
RES="$?"
 
if [ $RES = 1 ];then
export OUTDIR=$OUT_DIR_COMMON_BASE/$thisDIR
echo -e ""
echo -e ${cya}"External out DIR is set ($OUTDIR)"${txtrst}
echo -e ""
elif [ $RES = 0 ];then
export OUTDIR=$DIR/out
echo -e ""
echo -e ${cya}"No external out, using default ($OUTDIR)"${txtrst}
echo -e ""
else
echo -e ""
echo -e ${red}"NULL"${txtrst}
echo -e ${red}"Error wrong results; blame michael"${txtrst}
echo -e ""
fi
 
# get OS (linux / Mac OS x)
IS_DARWIN=$(uname -a | grep Darwin)
if [ -n "$IS_DARWIN" ]; then
CPUS=$(sysctl hw.ncpu | awk '{print $2}')
DATE=gdate
else
CPUS=$(grep "^processor" /proc/cpuinfo | wc -l)
DATE=date
fi
 
export USE_CCACHE=1
 
opt_clean=0
opt_dex=0
opt_jobs="$CPUS"
opt_sync=0
 
while getopts "c:dfj:s" opt; do
case "$opt" in
c) opt_clean="$OPTARG" ;;
d) opt_dex=1 ;;
j) opt_jobs="$OPTARG" ;;
s) opt_sync=1 ;;
*) usage
esac
done
shift $((OPTIND-1))
if [ "$#" -ne 1 ]; then
usage
fi
device="$1"
 
if [ "$opt_clean" -eq 1 ]; then
make clean
make installclean
echo -e ""
echo -e ${bldblu}"Out is clean"${txtrst}
echo -e ""
elif [ "$opt_clean" -eq 2 ]; then
make dirty >/dev/null
echo -e ""
echo -e ${bldblu}"Out is dirty"${txtrst}
echo -e ""
fi
 
# sync with latest sources
if [ "$opt_sync" -ne 0 ]; then
echo -e ""
echo -e ${bldblu}"Fetching latest sources"${txtrst}
repo sync -j"$opt_jobs"
echo -e ""
fi
 
# get time of startup
t1=$($DATE +%s)
 
# setup environment
echo -e ${bldblu}"Setting up environment"${txtrst}
. build/envsetup.sh
 
# brunch device
echo -e ""
echo -e ${bldblu}"Lunching device"${txtrst}
lunch "psd_$device-userdebug";
 
echo -e ""
echo -e ${bldblu}"Starting compilation"${txtrst}
 
# start compilation
if [ "$opt_dex" -ne 0 ]; then
export WITH_DEXPREOPT=true
fi
 
make -j"$opt_jobs" bacon
 
# finished? get elapsed time
t2=$($DATE +%s)
 
tmin=$(( (t2-t1)/60 ))
tsec=$(( (t2-t1)%60 ))
 
echo -e ${bldgrn}"Total time elapsed:${txtrst} ${grn}$tmin minutes $tsec seconds"${txtrst}
