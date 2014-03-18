# All Official PSD ROMs use SM 4.8.3.  Non-official can use Google 4.8 or change version here
GCC_VERSION_AND := 4.8
SM_AND_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-$(GCC_VERSION_AND)
SM_AND := $(shell $(SM_AND_PATH)/bin/arm-linux-androideabi-gcc --version)
ifneq ($(filter (SM-Toolchain),$(SM_AND)),)
ifneq ($(GCC_VERSION_ARM),4.9)
SM_AND_VERSION := $(filter 4.8 4.8.%,$(SM_AND))
else
# GCC Colors only works on gcc 4.9.x
$(shell `export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'`)
SM_AND_VERSION := $(filter 4.9 4.9.%,$(SM_AND))
endif
SM_AND_NAME := (SM-Toolchain)
SM_AND_DATE := $(filter 20140% 20141%,$(SM_AND))
SM_AND_STATUS := $(filter (release) (prerelease) (experimental),$(SM_AND))
SM_AND_VERSION := $(SM_AND_NAME)$(SM_AND_VERSION)($(SM_AND_DATE))-$(SM_AND_STATUS)
endif

ifneq ($(SM_AND_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.android=$(SM_AND_VERSION)
endif
