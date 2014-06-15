ifeq (psd_d801,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_d801.mk)

# Inherit device configuration
$(call inherit-product, device/lge/d801/d801.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d801
PRODUCT_NAME := psd_d801
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D801
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d801 BUILD_FINGERPRINT=lge/g2_tmo_us/g2:4.4.2/KOT49I.D80120a/D80120a.1391414342:user/release-keys PRIVATE_BUILD_DESC="g2_tmo_us-user 4.4.2 KOT49I.D80120a D80120a.1391414342 release-keys"

endif
