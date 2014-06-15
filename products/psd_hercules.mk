ifeq (psd_hercules,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_hercules.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/hercules/full_hercules.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_hercules
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SGH-T989
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-T989 TARGET_DEVICE=SGH-T989 BUILD_FINGERPRINT="samsung/SGH-T989/SGH-T989:4.4/KRT16M/T989UVMC6:user/release-keys" PRIVATE_BUILD_DESC="SGH-T989-user 4.4 KRT16M UVMC6 release-keys"

endif
