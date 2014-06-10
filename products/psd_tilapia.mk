ifeq (psd_tilapia,$(TARGET_PRODUCT))
include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_tilapia.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/asus/tilapia/full_tilapia.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_tilapia
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasig BUILD_FINGERPRINT="google/nakasig/tilapia:4.4/KRT16S/920375:user/release-keys" PRIVATE_BUILD_DESC="nakasig-user 4.4 KRT16S 920375 release-keys"
endif
