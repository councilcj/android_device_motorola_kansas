# Inherit from generic 64-bit configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from your local device.mk (The Fix!)
$(call inherit-product, device/motorola/kansas/device.mk)

# Inherit PBRP/Omni common bits
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_DEVICE := kansas
PRODUCT_NAME := omni_boot
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G 2025
PRODUCT_MANUFACTURER := motorola

BUILD_FINGERPRINT := motorola/kansas/kansas:16/V1.0.0/release-keys
