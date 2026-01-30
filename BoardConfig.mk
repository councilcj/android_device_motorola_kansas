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
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kansas
TARGET_NO_BOOTLOADER := true

# --- THE "STABLE GRAPHICS" FIX ---
# We force MinUI (Safe Mode) and use the exact format from your SurfaceFlinger grep
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1604
TARGET_SCREEN_DENSITY := 280
RECOVERY_GRAPHICS_FORCE_USE_LINUX_FB := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# --- THE "GREP-ALIGNED" BUTTONS ---
# Volume Up/Down = Navigate, Power = Select
BOARD_HAS_NO_SELECT_BUTTON := false
TW_RECOVERY_BUTTONS := true
# Blacklist everything else to prevent "ghost touches" from crashing the UI
TW_INPUT_BLACKLIST := "hbtp_vm,fts_ts"

# Kernel Configuration
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11080000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_KERNEL_IMAGE_NAME := Image

# --- THE "NO-PANIC" COMMAND LINE ---
BOARD_KERNEL_CMDLINE := androidboot.boot_devices=soc/11270000.ufshci
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=fastboot
BOARD_KERNEL_CMDLINE += loop.max_part=7
# 'nomodeset' prevents the Mediatek driver from switching modes and flickering
BOARD_KERNEL_CMDLINE += nomodeset
BOARD_KERNEL_CMDLINE += fbcon=map:0
BOARD_KERNEL_CMDLINE += mtk_disp_mgr.wait_vblank=0
BOARD_KERNEL_CMDLINE += video=720x1604@60
BOARD_KERNEL_CMDLINE += androidboot.fbcon=0

# Prebuilt Assets
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)
BOARD_PREBUILT_DTBIMAGE := $(DEVICE_PATH)/dtb
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel

# Platform & Partitions
TARGET_BOARD_PLATFORM := mt6835
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
TARGET_COPY_OUT_VENDOR := vendor

# Recovery UI - High Visibility
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 255
TW_NO_SCREEN_BLANK := true

# Anti-rollback bypass
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.2
