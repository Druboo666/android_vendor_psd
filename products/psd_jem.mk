ifeq (psd_jem,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_jem.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/amazon/jem/full_jem.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_jem
PRODUCT_DEVICE := jem
PRODUCT_RELEASE_NAME := KindleFireHD
PRODUCT_BRAND := google
PRODUCT_MODEL := Amazon Jem
PRODUCT_MANUFACTURER := android

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jem TARGET_DEVICE=jem

endif
