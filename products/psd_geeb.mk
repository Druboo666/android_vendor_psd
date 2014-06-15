ifeq (psd_geeb,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_geeb.mk)

# Inherit device configuration
$(call inherit-product, device/lge/geeb/full_geeb.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_geeb
PRODUCT_DEVICE := geeb
PRODUCT_BRAND := LGE
PRODUCT_MANUFACTURER := LGE
PRODUCT_MODEL := Optimus G

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=geeb BUILD_FINGERPRINT="lge/gee/geeb:4.4.2/KOT49H/937116:user/release-keys" PRIVATE_BUILD_DESC="gee-user 4.4.2 KOT49H 937116 release-keys"

endif
