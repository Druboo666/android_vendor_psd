ifeq (psd_enrc2b,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_enrc2b.mk)

# Inherit device configuration
$(call inherit-product, device/htc/enrc2b/full_enrc2b.mk)

# Override AOSP build properties
PRODUCT_DEVICE := enrc2b
PRODUCT_NAME := psd_enrc2b
PRODUCT_BRAND := htc_europe
PRODUCT_MODEL := One X+
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=enrc2b \
    BUILD_FINGERPRINT="htc_europe/enrc2b/enrc2b:4.3/JRO03C/125529.22:user/release-keys" \
    PRIVATE_BUILD_DESC="3.14.401.22 CL125529 release-keys"

endif
