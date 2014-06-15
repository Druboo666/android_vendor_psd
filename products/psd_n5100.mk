ifeq (psd_n5100,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_n5100.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n5100/full_n5100.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_n5100
PRODUCT_DEVICE := n5100
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := GT-N5100

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N5100 TARGET_DEVICE=GT-N5100 BUILD_FINGERPRINT="samsung/kona3gxx/kona3g:4.3/JSS15J/N5100XXBMD1:user/release-keys" PRIVATE_BUILD_DESC="kona3gxx-user 4.3 JSS15J N5100XXBMD1 release-keys"

endif

