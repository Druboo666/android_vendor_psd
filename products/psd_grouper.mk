TARGET_PRODUCT := pa_grouper
# Device info
PSD_TARGET_PRODUCT := psd_grouper

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_grouper.mk)
