#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/mondrian

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_dlkm
# BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := taro
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := mondrian_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/mondrian

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm odm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := taro

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist

# Crypto
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 13
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# TWRP Configuration
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 200
TW_EXCLUDE_APEX := true

# QCOM_FIX
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Kernel modules
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko focaltech_fts.ko goodix_core.ko qti_battery_charger.ko"

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Tool
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true

ifeq ($(TW_DEVICE_VERSION),)
TW_DEVICE_VERSION=13.0
endif

# Serialno
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
