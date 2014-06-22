ifeq (psd_grouper,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

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

# Call pa device
$(call inherit-product, vendor/pa/products/pa_grouper.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_grouper
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi BUILD_FINGERPRINT="google/nakasi/grouper:4.4.2/KOT49H/937116:user/release-keys"
PRIVATE_BUILD_DESC="nakasi-user 4.4.2 KOT49H 937116 release-keys"
endif
