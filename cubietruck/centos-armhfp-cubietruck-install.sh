#!/bin/sh
#
# Author: atyu30 <iopenbsd@gmail.com>
#
# Last modified: 2015-12-22 23:43
#
# Filename: centos-armhfp-cubietruck-install.sh
#
# Description: 
#
xzcat CentOS-Userland-7-armv7hl-Minimal-1511-CubieTruck.img.xz | dd of=/dev/mmcblk0 status=progress bs=4M
