TARGET_PRODUCT := pa_toro
# Device info
PSD_TARGET_PRODUCT := psd_toro

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_toro.mk)
