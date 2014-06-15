ifeq (psd_moto_msm8960dt,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_msm8960dt.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/moto_msm8960dt/full_moto_msm8960dt.mk)

# Override AOSP build properties
PRODUCT_DEVICE := moto_msm8960dt
PRODUCT_NAME := psd_moto_msm8960dt
PRODUCT_BRAND := motorola
PRODUCT_MODEL := MOTOROLA MSM8960DT
PRODUCT_MANUFACTURER := motorola

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=motorola \
    TARGET_DEVICE=moto_msm8960dt

endif
