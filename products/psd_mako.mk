TARGET_PRODUCT := pa_mako
# Device info
PSD_TARGET_PRODUCT := psd_mako

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_mako.mk)
