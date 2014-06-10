ifeq (psd_toroplus,$(TARGET_PRODUCT))
include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_toroplus.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/toroplus/full_toroplus.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_toroplus
PRODUCT_BRAND := Google
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mysidspr BUILD_FINGERPRINT="google/mysidspr/toroplus:4.4.2/KOT49H/737497:user/release-keys" PRIVATE_BUILD_DESC="mysidspr-user 4.4.2 KOT49H 737497 release-keys"
endif
