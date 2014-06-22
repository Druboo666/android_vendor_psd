ifeq (psd_find7,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_find7.mk)

# Inherit device configuration
$(call inherit-product, device/oppo/find7/full_find7.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_find7
PRODUCT_DEVICE := find7
PRODUCT_BRAND := OPPO
PRODUCT_MANUFACTURER := OPPO
PRODUCT_MODEL := find7

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_PRODUCT=find7 \
    TARGET_DEVICE=find7 \
    BUILD_FINGERPRINT="4.3/JLS36C/1390465867:user/release-keys" \
    PRIVATE_BUILD_DESC="msm8974-user 4.3 JLS36C eng.root.20140510.152835 release-keys"

endif
