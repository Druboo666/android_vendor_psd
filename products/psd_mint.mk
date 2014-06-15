ifeq (psd_mint,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_mint.mk)

# Inherit device configuration
$(call inherit-product, device/sony/mint/full_mint.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_mint
PRODUCT_DEVICE := mint
PRODUCT_BRAND := sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia T
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=LT30p \
    BUILD_FINGERPRINT=Sony/LT30p/LT30p:4.3/9.2.A.0.295/2P7_tg:user/release-keys \
    PRIVATE_BUILD_DESC="LT30p-user 4.3 JB-MR2-BLUE-CAF-140119-1326 51 test-keys"

endif
