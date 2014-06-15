ifeq (psd_gee,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_gee.mk)

# Inherit device configuration
$(call inherit-product, device/lge/gee/full_gee.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_gee
PRODUCT_DEVICE := gee
PRODUCT_BRAND := LGE
PRODUCT_MANUFACTURER := LGE
PRODUCT_MODEL := Optimus G

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=gee BUILD_FINGERPRINT="lge/gee/gee:4.4.2/KOT49H/937116:user/release-keys" PRIVATE_BUILD_DESC="gee-user 4.4.2 KOT49H 937116 release-keys"

endif
