# Heritage / Identity
PRODUCT_NAME := kansas
PRODUCT_DEVICE := kansas
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g play 5G - 2024

# --- THE NINJA FIX ---
# Removed dtb.img and dtbo.img from here because BoardConfig.mk 
# handles them via BOARD_PREBUILT_DTBIMAGE and BOARD_PREBUILT_DTBOIMAGE.
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/kernel:kernel

# Recovery / FSTAB
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.fstab:recovery/root/system/etc/recovery.fstab

# Inherit from common AOSP/TWRP parts
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
