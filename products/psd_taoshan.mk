ifeq (psd_taoshan,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_taoshan.mk)

# Inherit device configuration
$(call inherit-product, device/sony/taoshan/taoshan.mk)

# Screen resoultion in Pixels.
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# Override AOSP build properties
PRODUCT_NAME := psd_taoshan
PRODUCT_DEVICE := taoshan
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia L
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C2105_1275-0241 BUILD_FINGERPRINT=Sony/C2105_1275-0241/C2105:4.2.2/15.3.A.0.26/Android.0031:user/release-keys PRIVATE_BUILD_DESC="C2105-user 4.2.2 JDQ39 Android.0031 test-keys"
    
endif
