ifeq (psd_d800,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_d800.mk)

# Inherit device configuration
$(call inherit-product, device/lge/d800/d800.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d800
PRODUCT_NAME := psd_d800
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D800
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d800 BUILD_FINGERPRINT=lge/g2_att_us/g2:4.4.2/KOT49I.D80020c/D80020c.1391309241:user/release-keys PRIVATE_BUILD_DESC="g2_att_us-user 4.4.2 KOT49I.D80020c D80020c.1391309241 release-keys"

endif
