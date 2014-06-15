ifeq (psd_n7000,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_n7000.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n7000/full_n7000.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_n7000
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := Galaxy Note
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N7000 TARGET_DEVICE=GT-N7000 BUILD_FINGERPRINT=samsung/GT-N7000/GT-N7000:4.0.3/IML74K/ZCLP6:user/release-keys PRIVATE_BUILD_DESC="GT-N7000-user 4.0.3 IML74K ZCLP6 release-keys"

endif

