#!/bin/bash
mkfs.ext4 /dev/sda2

mkswap /dev/sda1

mount /dev/sda2 /mnt

swapon /dev/sda1

pacstrap -K /mnt base linux linux-firmware php php-apache sudo vim mediawiki zerotier-one grub wpa_supplicant
