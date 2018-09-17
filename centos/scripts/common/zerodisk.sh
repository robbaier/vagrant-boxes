#!/bin/sh -eux

yum -y --enablerepo='*' clean all;
rm -rf /var/cache/yum;

rm -f /core*;
rm -rf /tmp/*;

rpmdb --rebuilddb;
rm -f /var/lib/rpm/__db*;

# Whiteout root
count=$(df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}')
count=$(($count-1))
dd if=/dev/zero of=/tmp/whitespace bs=1M count=$count || echo "dd exit code $? is suppressed";
rm /tmp/whitespace

# Whiteout /boot
count=$(df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}')
count=$(($count-1))
dd if=/dev/zero of=/boot/whitespace bs=1M count=$count || echo "dd exit code $? is suppressed";
rm /boot/whitespace

set +e
swapuuid="`/sbin/blkid -o value -l -s UUID -t TYPE=swap`";
case "$?" in
    2|0) ;;
    *) exit 1 ;;
esac
set -e

if [ "x${swapuuid}" != "x" ]; then
    # Whiteout the swap partition to reduce box size
    # Swap is disabled till reboot
    swappart="`readlink -f /dev/disk/by-uuid/$swapuuid`";
    /sbin/swapoff "$swappart";
    dd if=/dev/zero of="$swappart" bs=1M || echo "dd exit code $? is suppressed";
    /sbin/mkswap -U "$swapuuid" "$swappart";
fi

sync;
