# Heritage / Identity
PRODUCT_NAME := kansas
PRODUCT_DEVICE := kansas
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g play 5G - 2024

# --- THE NINJA FIX ---
# This tells the build system to copy your files into the 'out' folder 
# so Ninja can find them to build the boot.img
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/kernel:kernel \
    $(DEVICE_PATH)/dtb.img:dtb.img \
    $(DEVICE_PATH)/dtbo.img:dtbo.img

# Recovery / FSTAB
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.fstab:recovery/root/system/etc/recovery.fstab

# Inherit from common AOSP/TWRP parts
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
