ifeq (psd_jemlte,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_jemlte.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/amazon/jemlte/full_jemlte.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_jemlte
PRODUCT_DEVICE := jemlte
PRODUCT_RELEASE_NAME := KindleFireHD
PRODUCT_BRAND := google
PRODUCT_MODEL := Amazon Jem LTE
PRODUCT_MANUFACTURER := android

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jemlte TARGET_DEVICE=jemlte

endif
