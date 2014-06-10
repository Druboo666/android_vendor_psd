ifeq (psd_toro,$(TARGET_PRODUCT))
include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_toro.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/toro/full_toro.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_toro
PRODUCT_BRAND := Google
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mysid BUILD_FINGERPRINT="google/mysid/toro:4.4.2/KOT49H/737497:user/release-keys" PRIVATE_BUILD_DESC="mysid-user 4.4.2 KOT49H 737497 release-keys"
endif
