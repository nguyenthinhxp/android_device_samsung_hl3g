$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/hl3g/hl3g-vendor.mk)

# Dalvik VM specific for devices with 2048 MB of RAM
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

#DEVICE_PACKAGE_OVERLAYS += device/samsung/hl3g/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Local Path
LOCAL_PATH := device/samsung/hl3g

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.universal5260:root/fstab.universal5260 \
    $(LOCAL_PATH)/rootdir/init.wifi.rc:root/init.wifi.rc \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/rootdir/init.universal5260.rc:root/init.universal5260.rc \
    $(LOCAL_PATH)/rootdir/init.universal5260.usb.rc:root/init.universal5260.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.universal5260.rc:root/ueventd.universal5260.rc \

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Camera
PRODUCT_PACKAGES += \
    Snap

# needed by open-source audio-hal
PRODUCT_PACKAGES += \
    mixer_paths.xml

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Radio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/sbin/cbd:root/sbin/cbd

# RIL
PRODUCT_PACKAGES += \
    libsecril-client

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=Exynos5260RIL

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# USB Accesory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Service mode
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.ecg.xml:system/etc/permissions/android.hardware.sensor.heartrate.ecg.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:system/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \


# ADB
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.arch=exynos5420 \
    debug.hwui.render_dirty_regions=false \
    ro.opengles.version=196608 \
    ro.zygote.disable_gl_preload=true
    persist.radio.multisim.config=dsds \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=512m 
