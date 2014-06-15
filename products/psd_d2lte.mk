ifeq (psd_d2lte,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_d2lte.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/d2lte/full_d2lte.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_d2lte
PRODUCT_DEVICE := d2lte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := d2lte

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d2lte TARGET_DEVICE=d2lte

endif
