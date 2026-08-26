#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/haydn

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := haydn,haydnin

# Kernel
TARGET_KERNEL_CONFIG += vendor/haydn_QGKI.config

# Kernel modules
BOOT_KERNEL_MODULES := \
    focaltech_touch.ko \
    hwid.ko \
    msm_drm.ko \
    xiaomi_touch.ko

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Board
TARGET_BOOTLOADER_BOARD_NAME := haydn

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# Include proprietary files
include vendor/xiaomi/haydn/BoardConfigVendor.mk

# Inherit from proprietary files for Leica Camera
-include vendor/xiaomi/haydn-miuicamera/products/board.mk

# Inherit Firmware (V816.0.19.0.UKKMIXM)
-include vendor/xiaomi/haydn-firmware/BoardConfigVendor.mk
