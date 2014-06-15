ifeq (psd_a700,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_a700.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/acer/a700/full_a700.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_a700
PRODUCT_DEVICE := a700
PRODUCT_BRAND := Acer
PRODUCT_MODEL := A700
PRODUCT_MANUFACTURER := acer
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a700_emea_cus1 TARGET_DEVICE=picasso_mf BUILD_FINGERPRINT="acer/a700_emea_cus1/picasso_mf:4.0.4/IMM76D/1337332281:user/release-keys" PRIVATE_BUILD_DESC="a700_emea_cus1-user 4.0.4 IMM76D 1337332281 release-keys"

endif
