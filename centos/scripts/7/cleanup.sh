#!/bin/sh -eux

yum -y update;
yum -y clean all;

yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts;
yum -y erase kernel-devel kernel-firmware kernel-headers gcc gcc-c++;

rm -rf VBoxGuestAdditions_*.iso;

# Clean up network interface persistence
[ -f /etc/udev/rules.d/70-persistent-net.rules ] && rm -rf /etc/udev/rules.d/70-persistent-net.rules
[ -f /lib/udev/rules.d/75-persistent-net-generator.rules ] && rm -rf /lib/udev/rules.d/75-persistent-net-generator.rules;
[ -f /dev/.udev ] && rm -rf /dev/.udev/;

for ndev in `ls -1 /etc/sysconfig/network-scripts/ifcfg-*`; do
    if [ "`basename $ndev`" != "ifcfg-lo" ]; then
        sed -i '/^HWADDR/d' "$ndev";
        sed -i '/^UUID/d' "$ndev";
    fi
done

# Remove documentation
rm -rf /usr/share/doc/*;

# Remove unused locales
rm -rf /usr/lib/locale/*;
rm -rf /usr/share/locale/*;
localedef -c -i en_US -f UTF-8 en_US.UTF-8;

# Delete logs
find /var/log/ -name *.log -exec rm -f {} \;

# Remove old kernels
package-cleanup --oldkernels --count=1 -y
