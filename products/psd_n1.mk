ifeq (psd_n1,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_n1.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/oppo/n1/full_n1.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_n1
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := n1
PRODUCT_MANUFACTURER := Oppo
TARGET_VENDOR_DEVICE_NAME := N1
PRODUCT_GMS_CLIENTID_BASE := android-oppo

endif
