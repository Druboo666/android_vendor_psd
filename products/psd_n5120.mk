ifeq (psd_n5120,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_n5120.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n520/full_n5120.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_n5120
PRODUCT_DEVICE := n5120
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := GT-N5120

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N5120 TARGET_DEVICE=GT-N5120 BUILD_FINGERPRINT="samsung/konaltexx/konalte:4.2.2/JDQ39/N5120XXCMI1:user/release-keys" PRIVATE_BUILD_DESC="konaltexx-user 4.2.2 JDQ39 N5120XXCMI1 release-keys"

endif
