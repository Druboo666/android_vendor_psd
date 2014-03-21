# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_VERSION_TAGS=release-keys \
    USER=android-build \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    BUILD_UTC_DATE=$(shell date +"%s")

# Enable ADB authentication
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1

# Remix Packages
PRODUCT_PACKAGES += \
    LockClock \
    Trebuchet \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    ScreenRecorder \
    libscreenrecorder \
    KernelTweaker
