ifeq (psd_serranoltexx,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_serranoltexx.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/serranoltexx/full_serranoltexx.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_serranoltexx
PRODUCT_DEVICE := serranoltexx
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9190

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=serranoltexx BUILD_FINGERPRINT="samsung/serranoltexx/serranolte:4.4.2/KOT49H/I9195XXUCNE6:user/release-keys" PRIVATE_BUILD_DESC="serranoltexx-user 4.4.2 KOT49H I9195XXUCNE6 release-keys"

endif
