TARGET_PRODUCT := pa_manta
# Device info
PSD_TARGET_PRODUCT := psd_manta

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_manta.mk)
