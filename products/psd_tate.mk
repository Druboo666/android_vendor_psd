ifeq (psd_tate,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_tate.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/amazon/tate/full_tate.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_tate
PRODUCT_DEVICE := tate
PRODUCT_RELEASE_NAME := KindleFireHD
PRODUCT_BRAND := google
PRODUCT_MODEL := Amazon Tate
PRODUCT_MANUFACTURER := android

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=tate TARGET_DEVICE=tate

endif
