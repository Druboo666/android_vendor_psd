#
# Copyright (C) 2014 Paul Beeler
# Copyright (C) 2014 AOSPAL Paranoid SaberDroid
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

# begin generic MODULAR customizations
# Here will contain modular customizations for various ROM features or fixes.
# Most if not all of these features are disabled by default unless envoked elsewhere.
# This will act as a generic configuration.
# Adding more modules here (device specific or not), will remain compatible accrossed all devices.
# 

# begin pthread support
# Enabled by default when "USING_SABER_LINUX := yes" is used.
# Bug fix for saber linux ART and other modules that may need it.
# Use when having building errors related to "pthread".
# The last "error" in the build will tell you which module has an issue by having a name *****_intermidates.
# Here will be the module name excluding "_intermidates".
THREADS_MODULE_LIST := oatdump dex2oat
THREAD_FLAGS := -pthread
# end pthread support

# begin graphite support
# Enabled by default when "ENABLE_GRAPHITE := true" + "USING_SABER_LINUX := yes" are both used.
# ADD more modules here if needed.
# Examples of graphite needing to be disabled is if the build fails with a internal compiler error.
# The last "error" in the build will tell you which module has an issue by having a name *****_intermidates.
# Here will be the module name excluding "_intermidates".
DISABLE_GRAPHITE_MODULES := \
	libstagefright_amrwbenc \
	libFFTEm \
	libwebviewchromium \
	libstagefright_mp3dec \
	libjni_filtershow_filters \
	libwebrtc_spl \
	mdnsd
# end graphite support

# begin strict-aliasing
# Enabled by default when "MAKE_STRICT_GLOBAL := true" is used.
# ADD more modules here only if needed to the appropriate category.
# If it's device specific create a new category if there's not one present.
# Examples of strict needing to be disabled is if the build fails with a lot of errors saying strict-aliasing rules are being broken.
# The last "error" in the build will tell you which module has an issue by having a name *****_intermidates.
# Here will be the module name excluding "_intermidates".

# Common module list
DISABLE_STRICT_MODULES := \
	base_base_gyp \
	busybox \
	e2fsck \
	e2fsck_host \
	libcrypto-host \
	libwnndict \
	libdvm \
	libmedia \
	mdnsd \
	libslang \
	llvm-rs-cc \
	ping \
	libaudioflinger \
	libmediaplayerservice \
	libstagefright \
	libsurfaceflinger \
	libfdlibm \
	libcyanogen-dsp \
	librtp_jni \
	libldnhncr \
	libdownmix \
	libvisualizer \
	libuclibcrpc \
	libcrypto_static

# CLANG
DISABLE_STRICT_CLANG := \
	libclangFrontend \
	libclangARCMigrate \
	libclangSerialization \
	libclangCodeGen \
	libclangRewriteFrontend \
	libclangParse \
	libclangRewriteCore \
	libclangSema \
	libclangStaticAnalyzerFrontend \
	libclangStaticAnalyzerCheckers \
	libclangStaticAnalyzerCore \
	libclangAnalysis \
	libclangEdit \
	libclangAST
# WebKit
DISABLE_STRICT_WEBKIT := \
	third_party_WebKit_Source_core_webcore_platform_gyp \
	third_party_WebKit_Source_core_webcore_remaining_gyp \
	third_party_WebKit_Source_core_webcore_derived_gyp \
	third_party_WebKit_Source_platform_blink_platform_gyp

# ext fs
DISABLE_STRICT_EXT := \
	libext2_blkid \
	libext2_blkid_host

# Add the other categories last
DISABLE_STRICT_MODULES += \
	$(DISABLE_STRICT_CLANG) \
	$(DISABLE_STRICT_QCOM) \
	$(DISABLE_STRICT_EXT) \
	$(DISABLE_STRICT_WEBKIT)

# Use the highest level of warning and turn all warnings into errors.
# This ensures that strict is not allowed to break any code in the source.
STRICT_FLAGS := -fstrict-aliasing -Wstrict-aliasing=3 -Werror=strict-aliasing
# end strict-aliasing

# begin unused-parameter warning fix
# This is a example of a unused-parameter error
# error: unused parameter 'len' [-Werror=unused-parameter]
# uncommented for now since there's no common warnings
# NO_ERROR_UP :=
# end unused-parameter waring fix

# end generic MODULAR customizations
