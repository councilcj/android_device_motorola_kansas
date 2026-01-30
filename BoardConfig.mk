#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/kansas

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kansas
TARGET_NO_BOOTLOADER := true

# Display - Precise 720x1604 LCD (Locked to 60Hz to prevent flicker)
TARGET_SCREEN_DENSITY := 280
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1604
BOARD_HAS_NO_SELECT_BUTTON := true

# Graphics: Mirrored from Slot A SurfaceFlinger (Format 1 = RGBA_8888)
RECOVERY_GRAPHICS_FORCE_USE_LINUX_FB := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# Kernel Configuration
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11080000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_KERNEL_IMAGE_NAME := Image

# Kernel Command Line - VITAL for Dimensity 6300 / MT6835
BOARD_KERNEL_CMDLINE := androidboot.boot_devices=soc/11270000.ufshci
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=fastboot
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += console=tty0
BOARD_KERNEL_CMDLINE += printk.devkmsg=on

# Mediatek Display Sync (Kills the Green/Rainbow flicker)
BOARD_KERNEL_CMDLINE += mtk_disp_mgr.wait_vblank=1
BOARD_KERNEL_CMDLINE += video=720x1604@60
BOARD_KERNEL_CMDLINE += androidboot.fbcon=1

# FocalTech (fts_ts) Touchscreen Wakers
BOARD_KERNEL_CMDLINE += androidboot.touch_vendor=1
BOARD_KERNEL_CMDLINE += fts_ts.customer_id=0

# DTB Handling
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)
BOARD_PREBUILT_DTBIMAGE := $(DEVICE_PATH)/dtb

# MKBOOTIMG Arguments
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Prebuilt Kernel
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Platform - Mediatek Dimensity 6300
TARGET_BOARD_PLATFORM := mt6835

# Recovery UI & Input
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := true

# Focus on FocalTech fts_ts and ignore virtual inputs
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_SUPPORT_INPUT_1_2 := true

# Brightness: Forced ON for display initialization
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 255
TW_NO_SCREEN_BLANK := true

# Anti-rollback bypass
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.2

# Build Fixes
BUILD_BROKEN_VENDOR_PROPERTY_CHECK := true
BUILD_BROKEN_DUP_RULES := true
