ifeq (psd_flo,$(TARGET_PRODUCT))
# Use 4.10.x for the kernel
GCC_VERSION_ARM := 4.10
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

ifneq ($(SM_ARM_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.arm=$(SM_ARM_VERSION)
endif

include vendor/psd/configs/psd_modular.mk

#Disable strict aliasing modules
DISABLE_STRICT_WEBKIT := \
        third_party_WebKit_Source_platform_blink_platform_gyp

DISABLE_STRICT_QCOM := \
        mm-vdec-omx-test
        
# Add other categories to common list to pass onto build repo
DISABLE_STRICT_MODULES += \
		$(DISABLE_STRICT_WEBKIT) \
		$(DISABLE_STRICT_QCOM)

# Set -fstrict-aliasing flag to global for flo
MAKE_STRICT_GLOBAL := true
# Optimize memory
OPT_MEMORY := true
# Enable graphite
ENABLE_GRAPHITE := true
# Saber linux toolchains
USING_SABER_LINUX := yes

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/asus/flo/full_flo.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_flo
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=razor BUILD_FINGERPRINT="google/razor/flo:4.4.2/KOT49H/937116:user/release-keys" PRIVATE_BUILD_DESC="razor-user 4.4 KOT49H 937116 release-keys"
endif
