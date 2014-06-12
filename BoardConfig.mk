USE_CAMERA_STUB := true

# inherit from the proprietary version
include vendor/motorola/domino/BoardConfigVendor.mk
# Use the Qualcomm common folder
include device/qcom/msm7x27/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := xt530
#Kernel related
TARGET_PREBUILT_KERNEL := device/motorola/domino/kernel
TARGET_KERNEL_CONFIG := domino_defconfig

BOARD_KERNEL_CMDLINE := mem=466M console=ttyHSL0,115200n8 androidboot.hardware=qcom androidboot.bootloader=3710
BOARD_KERNEL_BASE := 0x12e00000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 716800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 716800000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 235929600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 160768000
BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP and CWM
DEVICE_RESOLUTION := 320x480
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_HAS_DOWNLOAD_MODE := true
TW_MAX_BRIGHTNESS := 255
TW_ALWAYS_RMRF := true
TARGET_RECOVERY_FSTAB := device/motorola/domino/fstab.qcom

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

## Bluetooth
BOARD_HAVE_BLUETOOTH := true

## Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file

## RIL
#BOARD_PROVIDES_LIBRIL := true

## Lights
TARGET_PROVIDES_LIBLIGHT := true

## Touch screen compatibility
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Minimal fonts
SMALLER_FONT_FOOTPRINT := true
MINIMAL_FONT_FOOTPRINT := true

## Browser & WebKit
ENABLE_WEBGL := true
TARGET_WEBKIT_USE_MORE_MEMORY := true

# WIFI
USE_LEGACY_SOFTAP               := true
BOARD_WPA_SUPPLICANT_DRIVER     := tiap0
BOARD_WLAN_DEVICE               := wl1271
BOARD_WEXT_NO_COMBO_SCAN        := true
WIFI_DRIVER_MODULE_PATH         := "/system/etc/wifi/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME         := tiwlan_drv.ko

## Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27

## Wi-Fi Hotspot
BOARD_HAVE_LEGACY_HOSTAPD := true
BOARD_HOSTAPD_NO_ENTROPY := true

## RIL
BOARD_USES_LEGACY_RIL := true
BOARD_FORCE_RILD_AS_ROOT := true

## Audio: extamp support
BOARD_EXTAMP_AUDIO_FEATURE := true

## Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

## Fix colors in panorama mode
BOARD_CPU_COLOR_CONVERT := true

## GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

## Audio & FM Radio
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_AUDIO_LEGACY := false
BOARD_COMBO_DEVICE_SUPPORTED := true

## Camera
BOARD_CAMERA_NO_UNWANTED_MSG := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
TARGET_CAMERA_SENSOR_MP_SIZE := 5
TARGET_PREBUILT_LIBCAMERA := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

## Graphics
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_DOESNT_USE_FENCE_SYNC := true
TARGET_PREBUILT_LIBCAMERA := false
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DANCIENT_GL
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

## TEMPORARY HACK: skip building external/chromium_org/
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
