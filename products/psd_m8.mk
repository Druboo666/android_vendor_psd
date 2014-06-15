ifeq (psd_m8,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_m8.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m8/full_m8.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_m8
PRODUCT_DEVICE := m8
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := htc
PRODUCT_MODEL := m8

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m8 TARGET_DEVICE=m8

endif
