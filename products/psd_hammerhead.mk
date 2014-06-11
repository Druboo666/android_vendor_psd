ifeq (psd_hammerhead,$(TARGET_PRODUCT))
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

# qcom
DISABLE_STRICT_QCOM := \
	libqcomvisualizer

DISABLE_STRICT_MODULES += \
	$(DISABLE_STRICT_QCOM)

NO_ERROR_UP := \
	liboverlay \
	mm-jpeg-interface-test \
	gralloc.msm8974

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Optimize memory
OPT_MEMORY := true

# Enable graphite
ENABLE_GRAPHITE := true

# Saber linux toolchains
USING_SABER_LINUX := yes

# Set -fstrict-aliasing flag to global for hammerhead (for real this time)
MAKE_STRICT_GLOBAL := true

# Loading modules are sometimes needed for bug fixes in the kernel, but we need to load them with ROM scripts
PRODUCT_COPY_FILES += \
	vendor/psd/prebuilt/device/hammerhead/etc/init.d/88LoadMod:system/etc/init.d/88LoadMod \
	vendor/psd/prebuilt/device/hammerhead/etc/init.d/89InsMod:system/etc/init.d/89InsMod

# Call pa device
$(call inherit-product, vendor/pa/products/pa_hammerhead.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_hammerhead
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=hammerhead BUILD_FINGERPRINT="google/hammerhead/hammerhead:4.4.3/KTU84M/1158763:user/release-keys" PRIVATE_BUILD_DESC="hammerhead-user 4.4.3 KTU84M 1158763 release-keys"
endif
