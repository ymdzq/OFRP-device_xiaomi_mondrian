#!/system/bin/sh

rmmod goodix_core
mount /vendor_dlkm
insmod /vendor_dlkm/lib/modules/goodix_core.ko
umount /vendor_dlkm
