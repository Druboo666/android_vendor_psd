TARGET_PRODUCT := pa_maguro
# Device info
PSD_TARGET_PRODUCT := psd_maguro

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_maguro.mk)
