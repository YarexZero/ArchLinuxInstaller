#!/bin/bash
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

hwclock --systohc

grub-install --target=i386-pc /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

passwd

exit

umount -R /mnt

reboot
