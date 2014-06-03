# Device info
PSD_TARGET_PRODUCT := psd_d802

# Include device configuration before psd_board.mk args
$(call inherit-product, vendor/psd/products/$(PSD_TARGET_PRODUCT).mk)
