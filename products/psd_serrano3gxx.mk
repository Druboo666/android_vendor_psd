ifeq (psd_serrano3gxx,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_serrano3gxx.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/serrano3gxx/full_serrano3gxx.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_serrano3gxx
PRODUCT_DEVICE := serrano3gxx
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9190

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=serrano3gxx BUILD_FINGERPRINT="samsung/serrano3gxx/serrano3g:4.2.2/JDQ39/I9190XXUAMF7:user/release-keys" PRIVATE_BUILD_DESC="serrano3gxx-user 4.2.2 JDQ39 I9190XXUAMF7 release-keys"

endif
