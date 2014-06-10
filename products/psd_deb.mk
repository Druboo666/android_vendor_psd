ifeq (psd_deb,$(TARGET_PRODUCT))
# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

include vendor/psd/configs/psd_modular.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_deb.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/asus/deb/full_deb.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_deb
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=razorg BUILD_FINGERPRINT="google/razorg/deb:4.4.2/KOT49H/937116:user/release-keys" PRIVATE_BUILD_DESC="razorg-user 4.4.2 KOT49H 937116 release-keys"
endif
