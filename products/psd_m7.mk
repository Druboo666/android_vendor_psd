ifeq (psd_m7,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_m7.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m7/full_m7.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m7
PRODUCT_NAME := psd_m7
PRODUCT_BRAND := HTC
PRODUCT_MODEL := One
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m7 BUILD_ID=KOT49H.H1 BUILD_FINGERPRINT="htc/m7_google/m7:4.4.2/KOT49H.H1/288144:user/release-keys" PRIVATE_BUILD_DESC="3.62.1700.1 CL288144 release-keys"

endif
