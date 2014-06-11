$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/motorola/domino/domino-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/domino/overlay

LOCAL_PATH := device/motorola/domino
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/tiny.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_domino
PRODUCT_DEVICE := domino

#Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \

# Live wallpapers
PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Inherit products (Most specific first)
$(call inherit-product, vendor/motorola/domino/domino-vendor.mk)
$(call inherit-product, vendor/motorola/msm7x27-common/msm7x27-common-vendor-blobs.mk)

# Overrides
PRODUCT_NAME := XT530
PRODUCT_DEVICE := XT530
PRODUCT_MODEL := MOTOROLA-XT530
PRODUCT_MANUFACTURER := MOTOROLA

# MDPI neccesity
PRODUCT_AAPT_PREF_CONFIG := mdpi
$(call inherit-product, device/mdpi-common/mdpi.mk)

#Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/audio_policy.conf:system/etc/audio_policy.conf \

 # Board-specific init
PRODUCT_COPY_FILES += \
    device/motorola/domino/ramdisk/ueventd.xt530.rc:root/ueventd.xt530.rc \
    device/motorola/domino/ramdisk/init.xt530.rc:root/init.xt530.rc \
    device/motorola/domino/ramdisk/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    device/motorola/domino/ramdisk/init.goldfish.rc:root/init.goldfish.rc \
    device/motorola/domino/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/motorola/domino/ramdisk/init.qcom.rc:root/init.qcom.rc \

## Wifi Stuff
PRODUCT_COPY_FILES += \
    device/motorola/domino/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/motorola/domino/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Media
PRODUCT_COPY_FILES += \
    device/motorola/domino/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/motorola/domino/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/motorola/domino/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/motorola/domino/prebuilt/audio.conf:system/etc/bluetooth/audio.conf \
    device/motorola/domino/prebuilt/vold.fstab:system/etc/vold.fstab

# Shell scripts
PRODUCT_COPY_FILES += \
    device/motorola/domino/prebuilt/init.goldfish.sh:system/etc/init.goldfish.sh \
    device/motorola/domino/prebuilt/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/motorola/domino/prebuilt/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/motorola/domino/prebuilt/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/motorola/domino/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/motorola/domino/prebuilt/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \

## keymap
PRODUCT_COPY_FILES += \
    device/motorola/domino/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/motorola/domino/prebuilt/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/motorola/domino/prebuilt/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
    device/motorola/domino/prebuilt/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin

# Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    persist.service.adb.enable=1

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Inherit qcom/msm7x27
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)

# Install/Uninstall google apps
$(call inherit-product, vendor/google/gapps_armv6_tiny.mk)

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=false \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Common assets
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_LOCALES := en_US en_IN fr_FR it_IT es_ES et_EE de_DE nl_NL cs_CZ pl_PL ja_JP \
    zh_TW zh_CN zh_HK ru_RU ko_KR nb_NO es_US da_DK el_GR tr_TR pt_PT pt_BR rm_CH sv_SE \
    bg_BG ca_ES en_GB fi_FI hr_HR hu_HU in_ID lt_LT lv_LV ro_RO sk_SK sl_SI sr_RS uk_UA \
    vi_VN tl_PH sw_TZ ms_MY af_ZA zu_ZA en_XA ar_XB fr_CA mn_MN az_AZ

# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.xt530.rc \
    init.qcom.sh \
    ueventd.xt530.rc \
    ueventd.qcom.rc

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x27 \
    audio.primary.msm7x27

# Graphics & Media
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    lights.msm7x27 \
    libetcmdiface

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27 \
    librpc

# Build sim toolkit
PRODUCT_PACKAGES += \
    Stk

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27 \
    libcamera

# Others
PRODUCT_PACKAGES += \
    lights.msm7x27 \
    power.msm7x27 \
    make_ext4fs \
    setup_fs

# SELinux - we're not ready for enforcing mode yet
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled
