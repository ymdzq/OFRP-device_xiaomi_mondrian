#!/system/bin/sh

mount /vendor_dlkm

rmmod goodix_core && insmod /vendor_dlkm/lib/modules/goodix_core.ko
