# Inherit from generic 64-bit configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from your local device.mk
$(call inherit-product, device/motorola/kansas/device.mk)

# PBRP usually handles its own common bits, so we skip the vendor/omni line

PRODUCT_DEVICE := kansas
PRODUCT_NAME := omni_boot
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G 2025
PRODUCT_MANUFACTURER := motorola

BUILD_FINGERPRINT := motorola/kansas/kansas:16/V1.0.0/release-keys
