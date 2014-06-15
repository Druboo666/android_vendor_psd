ifeq (psd_hlte,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_htle.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/hlte/full_hlte.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_hlte
PRODUCT_DEVICE := hlte
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-N9005
PRODUCT_MANUFACTURER := Samsung
endif
