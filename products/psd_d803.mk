ifeq (psd_d803,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_d803.mk)

# Inherit device configuration
$(call inherit-product, device/lge/d803/d803.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d803
PRODUCT_NAME := psd_d803
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D803
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d803 BUILD_FINGERPRINT=lge/g2_ca/g2:4.4.2/KOT49I.D803B20e/D803B20e.1394602420:user/release-keys PRIVATE_BUILD_DESC="g2_ca-user 4.4.2 KOT49I.D803B20e D803B20e.1394602420 release-keys"

endif
