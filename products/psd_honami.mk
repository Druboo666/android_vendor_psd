ifeq (psd_honami,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_honami.mk)

# Inherit device configuration
$(call inherit-product, device/sony/honami/full_honami.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_honami
PRODUCT_DEVICE := honami
PRODUCT_BRAND := sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia Z1
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6903 TARGET_DEVICE=honami BUILD_FINGERPRINT=Sony/C6903/C6903:4.3/14.2.A.0.290/eng.hudsonslave:user/release-keys PRIVATE_BUILD_DESC="C6903-user 4.3 RHINE-1.1-131125-1201 eng.hudsonslave test-keys"
    
endif
