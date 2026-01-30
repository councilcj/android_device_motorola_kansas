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
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1604
TARGET_SCREEN_DENSITY := 280

# For MediaTek Kernel 5.15+, we often need these to let the DTB handle the display
RECOVERY_GRAPHICS_FORCE_USE_LINUX_FB := true
TW_NO_UI := false # Set to false if you want to try the GUI now that we have a DTB
TW_RECOVERY_BUTTONS := true

# --- BUTTONS & INPUT ---
BOARD_HAS_NO_SELECT_BUTTON := false
TW_INPUT_BLACKLIST := "hbtp_vm,fts_ts"

# Kernel Configuration - HEADER V4 (No manual offsets needed)
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096 # Most MT6835 use 4KB pages
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# --- THE "PREBUILT DNA" (The Flicker Fixers) ---
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBIMAGE := $(DEVICE_PATH)/prebuilt/dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Adding DTBO - This is critical for the MT6835 display driver
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_CUSTOM_DTBOIMG := $(DEVICE_PATH)/prebuilt/dtbo.img

# --- THE "NO-PANIC" COMMAND LINE ---
# We keep these clean to let the DTB do the heavy lifting
BOARD_KERNEL_CMDLINE := androidboot.boot_devices=soc/11270000.ufshci
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=fastboot
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += mtk_disp_mgr.wait_vblank=0
BOARD_KERNEL_CMDLINE += video=720x1604@60

# Platform & Partitions
TARGET_BOARD_PLATFORM := mt6835
BOARD_FLASH_BLOCK_SIZE := 131072 # Standard for UFS
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
TARGET_COPY_OUT_VENDOR := vendor

# Recovery UI - High Visibility
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150
TW_NO_SCREEN_BLANK := true

# Anti-rollback bypass
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.2
