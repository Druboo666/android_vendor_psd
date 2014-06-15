ifeq (psd_jflte,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_jflte.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/jflte/full_jflte.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_jflte
PRODUCT_DEVICE := jflte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := jflte

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jflte TARGET_DEVICE=jflte

endif
