# Device info
PSD_TARGET_PRODUCT := psd_hammerhead

# Copy kernel modules list over
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/hammerhead/etc/init.d/89ModList:system/etc/init.d/89ModList
