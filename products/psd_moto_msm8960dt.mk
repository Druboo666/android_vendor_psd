ifeq (psd_moto_msm8960dt,$(TARGET_PRODUCT))

# Use 4.9.x for the kernel
GCC_VERSION_ARM := 4.9
# Override ARM settings
SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-$(GCC_VERSION_ARM)
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)

ifneq ($(filter (SM-Toolchain) (SaberMod%),$(SM_ARM)),)
# GCC Colors only works on gcc >=4.9.x
export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
SM_ARM_VERSION := $(filter 4.8 4.8.% 4.9 4.9.% 4.10 4.10.%,$(SM_ARM))
SM_ARM_NAME := $(filter (SM-Toolchain) (SaberMod%),$(SM_ARM))
SM_ARM_DATE := $(filter 20130% 20131% 20140% 20141%,$(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental), $(SM_ARM))
ifeq ($(filter (SaberMod%),$(SM_ARM)),)
SM_ARM_VERSION := $(SM_ARM_NAME)_$(SM_ARM_VERSION)_$(SM_ARM_DATE)-$(SM_ARM_STATUS)
else
SM_ARM_VERSION := $(SM_ARM_NAME)-$(SM_ARM_DATE)-$(SM_ARM_STATUS)
endif
endif

include vendor/psd/configs/psd_modular.mk

ifneq ($(SM_ARM_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.arm=$(SM_ARM_VERSION)
endif

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Set -fstrict-aliasing flag to global
MAKE_STRICT_GLOBAL := true
# Optimize memory
OPT_MEMORY := true
# Enable graphite
ENABLE_GRAPHITE := true
# Saber linux toolchains
USING_SABER_LINUX := yes

# Call pa device
$(call inherit-product, vendor/pa/products/pa_msm8960dt.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/moto_msm8960dt/full_moto_msm8960dt.mk)

# Override AOSP build properties
PRODUCT_DEVICE := moto_msm8960dt
PRODUCT_NAME := psd_moto_msm8960dt
PRODUCT_BRAND := motorola
PRODUCT_MODEL := MOTOROLA MSM8960DT
PRODUCT_MANUFACTURER := motorola

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=motorola \
    TARGET_DEVICE=moto_msm8960dt

endif
