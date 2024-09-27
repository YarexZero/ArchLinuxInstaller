#!/bin/bash
pacstrap -K /mnt dhcpcd

locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "EndlessRPG-Server" > /etc/hostname

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt << EOF
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "EndlessRPG-Server" > /etc/hostname
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
passwd
EOF
