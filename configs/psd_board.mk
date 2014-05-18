# All Official PSD ROMs use SM 4.8.3. Non-official can use Uberutils' 4.8 or change version here
GCC_VERSION_AND := 4.8
SM_AND_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-$(GCC_VERSION_AND)
SM_AND := $(shell $(SM_AND_PATH)/bin/arm-linux-androideabi-gcc --version)
ifneq ($(filter (SM-Toolchain) (SaberMod%),$(SM_AND)),)
ifneq ($(GCC_VERSION_AND),4.9)
SM_AND_VERSION := $(filter 4.8 4.8.%,$(SM_AND))
else
# GCC Colors only works on gcc 4.9.x
$(shell `export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'`)
SM_AND_VERSION := $(filter 4.9 4.9.%,$(SM_AND))
endif
SM_AND_NAME := $(filter (SM-Toolchain) (SaberMod%),$(SM_AND))
SM_AND_DATE := $(filter 20130% 20131% 20140% 20141%,$(SM_AND))
SM_AND_STATUS := $(filter (release) (prerelease) (experimental),$(SM_AND))
ifeq ($(filter (SaberMod%),$(SM_AND)),)
SM_AND_VERSION := $(SM_AND_NAME)_$(SM_AND_VERSION)_$(SM_AND_DATE)-$(SM_AND_STATUS)
else
SM_AND_VERSION := $(SM_AND_NAME)-$(SM_AND_DATE)-$(SM_AND_STATUS)
endif
endif

ifneq ($(SM_AND_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.android=$(SM_AND_VERSION)
endif

# Toolchain version for kernel building
GCC_VERSION_ARM := 4.8

SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-$(GCC_VERSION_ARM)
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)

ifneq ($(filter (SM-Toolchain) (SaberMod%),$(SM_ARM)),)
ifneq ($(GCC_VERSION_ARM),4.9)
SM_ARM_VERSION := $(filter 4.8 4.8.%,$(SM_ARM))
else
# GCC Colors only works on gcc 4.9.x
export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
SM_ARM_VERSION := $(filter 4.9 4.9.%,$(SM_ARM))
endif
SM_ARM_NAME := $(filter (SM-Toolchain) (SaberMod%),$(SM_ARM))
SM_ARM_DATE := $(filter 20130% 20131% 20140% 20141%,$(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental), $(SM_ARM))
ifeq ($(filter (SaberMod%),$(SM_ARM)),)
SM_ARM_VERSION := $(SM_ARM_NAME)_$(SM_ARM_VERSION)_$(SM_ARM_DATE)-$(SM_ARM_STATUS)
else
SM_ARM_VERSION := $(SM_ARM_NAME)-$(SM_ARM_DATE)-$(SM_ARM_STATUS)
endif
endif

ifneq ($(SM_ARM_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.arm=$(SM_ARM_VERSION)
endif
