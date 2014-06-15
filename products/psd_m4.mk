ifeq (psd_m4,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_m4.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m4/full_m4.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m4
PRODUCT_NAME := psd_m4
PRODUCT_BRAND := HTC
PRODUCT_MODEL := One Mini
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m4 BUILD_FINGERPRINT="htc/htc_europe/m4:4.4.2/KOT49H/304638.4:user/release-keys" PRIVATE_BUILD_DESC="3.10.401.4 CL304638 release-keys"

endif
