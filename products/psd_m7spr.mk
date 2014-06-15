ifeq (psd_m7spr,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_m7spr.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m7spr/full_m7spr.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m7spr
PRODUCT_NAME := psd_m7spr
PRODUCT_BRAND := HTC
PRODUCT_MODEL := One
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m7spr BUILD_ID=KOT49H BUILD_FINGERPRINT="htc/sprint_wwe/m7wls:4.4.2/KOT49H/303687.4:user/release-keys" PRIVATE_BUILD_DESC="4.06.651.4 CL303687 release-keys"

endif
