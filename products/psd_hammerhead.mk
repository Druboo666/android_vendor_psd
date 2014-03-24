# Device info
PSD_TARGET_PRODUCT := psd_hammerhead

# Copy kernel modules list over
PRODUCT_COPY_FILES += \
    vendor/psd/prebuilt/device/hammerhead/etc/init.d/88LoadMod:system/etc/init.d/88LoadMod \
    vendor/psd/prebuilt/device/hammerhead/etc/init.d/89InsMod:system/etc/init.d/89InsMod
