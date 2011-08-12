# Inherit AOSP device configuration for blade.
$(call inherit-product, device/huawei/u8800/device_u8800.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_u8800
PRODUCT_BRAND := huawei
PRODUCT_DEVICE := u8800
PRODUCT_MODEL := u8800
PRODUCT_MANUFACTURER := huawei

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cyanogen_u8800 BUILD_ID=FRF91 BUILD_DISPLAY_ID=CM7-2.3-Geno-Goapk BUILD_FINGERPRINT=google/passion/passion:2.3.3/Geno/102588:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.3 Geno 102588 release-keys"

#
# Set ro.modversion
#

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-u8800
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-u8800
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-u8800-Geno
    endif
endif

#
# Copy legend specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
