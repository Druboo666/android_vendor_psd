ifeq (psd_v500,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_v500.mk)

# Inherit device configuration
$(call inherit-product, device/lge/v500/v500.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := v500
PRODUCT_NAME := psd_v500
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-V500
PRODUCT_MANUFACTURER := lge
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=awifi_open_eu BUILD_FINGERPRINT=lge/awifi_open_eu/awifi:4.2.2/JDQ39B/V50010a.1380629540:user/release-keys PRIVATE_BUILD_DESC="awifi_open_eu-user 4.2.2 JDQ39B V50010a.1380629540 release-keys"

endif
