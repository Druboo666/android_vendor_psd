ifeq (psd_tf201,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_tf201.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/asus/tf201/full_tf201.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_tf201
PRODUCT_BRAND := Asus
PRODUCT_MODEL := Transformer Prime
PRODUCT_MANUFACTURER := Asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=tf201 BUILD_FINGERPRINT=asus/US_epad/EeePad:4.1.1/JRO03C/US_epad-10.4.2.18-20121122:user/release-keys PRIVATE_BUILD_DESC="US_epad-user 4.1.1 JRO03C US_epad-10.4.2.18-20121122 release-keys"

endif
