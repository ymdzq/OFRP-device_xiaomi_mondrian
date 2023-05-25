#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from mondrian device
$(call inherit-product, device/xiaomi/mondrian/device.mk)

PRODUCT_DEVICE := mondrian
PRODUCT_NAME := omni_mondrian
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 23013RK75C
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="mondrian-user 13 SKQ1.220303.001 V14.0.24.0.TMNCNXM release-keys"

BUILD_FINGERPRINT := Redmi/mondrian/mondrian:13/SKQ1.220303.001/V14.0.24.0.TMNCNXM:user/release-keys
