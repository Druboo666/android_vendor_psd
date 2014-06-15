ifeq (psd_p880,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_p880.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p880/full_p880.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_p880
PRODUCT_DEVICE := p880
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := lge
PRODUCT_MODEL := LG-P880
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=x3_open_eu \
    TARGET_DEVICE=p880 \
    BUILD_FINGERPRINT="lge/x3_open_eu/x3:4.1.2/JZO54K/P88020a.1e56bb4c69:user/release-keys" \
    PRIVATE_BUILD_DESC="x3_open_eu-user 4.1.2 JZO54K P88020a.1e56bb4c69 release-keys"

endif
