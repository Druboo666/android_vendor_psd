ifeq (psd_find7a,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_find7a.mk)

# Inherit device configuration
$(call inherit-product, device/oppo/find7a/full_find7a.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_find7a
PRODUCT_DEVICE := find7a
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := Find7a
PRODUCT_MANUFACTURER := Oppo

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_PRODUCT=FIND7 \
    TARGET_DEVICE=FIND7 \
    BUILD_FINGERPRINT="4.3/JLS36C/1390465867:user/release-keys" \
    PRIVATE_BUILD_DESC="msm8974-user 4.3 JLS36C eng.root.20140510.152835 release-keys"

endif
