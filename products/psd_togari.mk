ifeq (psd_togari,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_togari.mk)

# Inherit device configuration
$(call inherit-product, device/sony/togari/full_togari.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_togari
PRODUCT_DEVICE := togari
PRODUCT_BRAND := sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia Z Ultra
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=C6833 \
    BUILD_FINGERPRINT=Sony/C6833_1274-8613/C6833:4.2.2/14.1.B.1.526/8bl_jw:user/release-keys \
    PRIVATE_BUILD_DESC="C6833-user 4.2.2 14.1.B.1.526 8bl_jw test-keys"

endif
