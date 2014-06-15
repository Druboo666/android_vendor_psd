ifeq (psd_ville,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_ville.mk)

# Inherit device configuration
$(call inherit-product, device/htc/ville/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ville
PRODUCT_NAME := psd_ville
PRODUCT_BRAND := HTC
PRODUCT_MODEL := One S
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_ville BUILD_FINGERPRINT=cingular_us/ville/ville:4.1.1/JRO03C/131981.6:user/release-keys PRIVATE_BUILD_DESC="3.18.502.6 CL131981 release-keys" BUILD_NUMBER=79936
    
endif
