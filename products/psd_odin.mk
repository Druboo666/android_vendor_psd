ifeq (psd_odin,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_odin.mk)

# Inherit device configuration
$(call inherit-product, device/sony/odin/full_odin.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_odin
PRODUCT_DEVICE := odin
PRODUCT_BRAND := sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia ZL
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6503 TARGET_DEVICE=odin BUILD_FINGERPRINT=Sony/C6503_1271-0336/C6503:4.2.2/10.3.A.0.423/WP5_rg:user/release-keys PRIVATE_BUILD_DESC="C6503-user 4.2.2 10.3.A.0.423 WP5_rg test-keys"
    
endif
