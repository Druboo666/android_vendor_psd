ifeq (psd_i9100g,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_i9100g.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/i9100g/full_i9100g.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_i9100g
PRODUCT_DEVICE := i9100g
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9100G
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=GT-I9100G TARGET_DEVICE=GT-I9100G BUILD_FINGERPRINT=samsung/GT-I9100G/GT-I9100G:4.1.2/JZO54K/I9100GXXLSR:user/release-keys PRIVATE_BUILD_DESC="GT-I9100G-user 4.1.2 JZO54K I9100GXXLSR release-keys"

endif
