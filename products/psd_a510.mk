ifeq (psd_a510,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_a510.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/acer/a510/full_a510.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_a510
PRODUCT_DEVICE := a510
PRODUCT_BRAND := Acer
PRODUCT_MODEL := A510
PRODUCT_MANUFACTURER := acer
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=a510_pa_cus1 TARGET_DEVICE=picasso_m BUILD_FINGERPRINT="acer/a510_pa_cus1/picasso_m:4.1.2/JZO54K/1354108731:user/release-keys" PRIVATE_BUILD_DESC="a510_pa_cus1-user 4.1.2 JZ054K 1354108731 release-keys"

endif
