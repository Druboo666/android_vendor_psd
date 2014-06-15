ifeq (psd_yuga,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_yuga.mk)

# Inherit device configuration
$(call inherit-product, device/sony/yuga/full_yuga.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_yuga
PRODUCT_DEVICE := yuga
PRODUCT_BRAND := sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia Z
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6603 TARGET_DEVICE=yuga BUILD_FINGERPRINT=Sony/C6603_1270-6697/C6603:4.2.2/10.3.A.0.423/WP5_rg:user/release-keys PRIVATE_BUILD_DESC="C6603-user 4.2.2 10.3.A.0.423 WP5_rg test-keys"
    
endif
