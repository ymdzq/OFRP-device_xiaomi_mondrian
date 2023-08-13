#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := mondrian

# Inherit from those products. Most specific first.
# 引用默认的编译配置文件，core_64_bit必须先于其他引用，否则不生效
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from mondrian device
$(call inherit-product, device/xiaomi/mondrian/device.mk)

PRODUCT_DEVICE := mondrian
PRODUCT_NAME := twrp_mondrian
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 23013RK75C
PRODUCT_MANUFACTURER := Xiaomi
#PRODUCT_RELEASE_NAME := Redmi K60

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
