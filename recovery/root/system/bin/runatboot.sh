#!/system/bin/sh

sleep 2
if [ ! -d /proc/goodix_ts ]; then
rmmod goodix_core
mount /vendor_dlkm
insmod /vendor_dlkm/lib/modules/goodix_core.ko
umount /vendor_dlkm
fi
