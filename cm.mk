## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := domino

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/mini.mk)

TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320
#TARGET_BOOTANIMATION_HALF_RES := true

# Inherit device configuration
$(call inherit-product, device/motorola/domino/domino.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := domino
PRODUCT_NAME := cm_domino
PRODUCT_BRAND := motorola
PRODUCT_MODEL := domino
PRODUCT_MANUFACTURER := motorola
PRODUCT_CHARACTERISTICS := phone

# Release name and versioning
PRODUCT_RELEASE_NAME := FIREXT
PRODUCT_VERSION_DEVICE_SPECIFIC :=

## Bootanimation
##TARGET_BOOTANIMATION_NAME := vertical-320x480
