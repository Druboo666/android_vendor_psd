TARGET_PRODUCT := pa_deb
# Device info
PSD_TARGET_PRODUCT := psd_deb

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

include vendor/psd/configs/psd_modular.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_deb.mk)
