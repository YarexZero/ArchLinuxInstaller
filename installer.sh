#!/bin/bash

mkfs.ext4 /dev/sda2

mkswap /dev/sda1

mount /dev/sda2 /mnt

swapon /dev/sda1

pacstrap -K /mnt base linux linux-firmware php php-apache sudo vim mediawiki zerotier-one grub iwd

locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "EndlessRPG-Server" > /etc/hostname

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

hwclock --systohc

grub-install --target=i386-pc /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

passwd

exit

umount -R /mnt

reboot
