ifeq (psd_edison,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_edison.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/edison/full_edison.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_edison
PRODUCT_BRAND := Motorola
PRODUCT_DEVICE := edison
PRODUCT_MODEL := MB865
PRODUCT_MANUFACTURER := Motorola
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=MB865_att TARGET_DEVICE=edison BUILD_FINGERPRINT="motorola/MB865_att/edison:4.0.4/6.7.2-226-EDICS-10/67.21.125:user/release-keys" PRIVATE_BUILD_DESC="edison-user 4.0.4 6.7.2-226-EDICS-10 67.21.125 release-keys"

endif
