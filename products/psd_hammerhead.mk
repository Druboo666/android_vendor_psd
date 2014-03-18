# Device info
PSD_TARGET_PRODUCT := psd_hammerhead

# Custom toolchain building.  Uncommit the ifeq/endif if your building with another 4.9 toolchian
ifeq ($(PSD_MEMBER),true)
GCC_VERSION_ARM := 4.9
else
GCC_VERSION_ARM := 4.8
endif

SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-$(GCC_VERSION_ARM)
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)

ifneq ($(filter (SM-Toolchain), $(SM_ARM)),)
ifneq ($(GCC_VERSION_ARM),4.9)
SM_ARM_VERSION := $(filter 4.8 4.8.%, $(SM_ARM))
else
# GCC Colors only works on gcc 4.9.x
$(shell `export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'`)
SM_ARM_VERSION := $(filter 4.9 4.9.%, $(SM_ARM))
endif
SM_ARM_NAME := (SM-Toolchain)
SM_ARM_DATE := $(filter 20140% 20141%, $(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental), $(SM_ARM))
SM_ARM_VERSION := $(SM_ARM_NAME)$(SM_ARM_VERSION)($(SM_ARM_DATE))-$(SM_ARM_STATUS)
endif

ifneq ($(SM_ARM_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.arm=$(SM_ARM_VERSION)
endif
