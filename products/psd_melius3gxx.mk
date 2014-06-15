ifeq (psd_melius3gxx,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_melius3gxx.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/melius3gxx/full_melius3gxx.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_melius3gxx
PRODUCT_DEVICE := melius3gxx
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := melius3gxx

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=melius3gxx BUILD_FINGERPRINT="samsung/melius3gxx/melius3g:4.2.2/JDQ39/I9200XXUAMEA:user/release-keys" PRIVATE_BUILD_DESC="melius3gxx-user 4.2.2 JDQ39 I9200XXUAMEA release-keys" BUILD_NUMBER=I9200XXUAMEA

endif
