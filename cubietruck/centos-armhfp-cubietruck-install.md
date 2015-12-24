#Install
xzcat CentOS-Userland-7-armv7hl-Minimal-1511-CubieTruck.img.xz | dd of=/dev/mmcblk0 status=progress bs=4M

#Setting
##Default User/Password
root/centos
##Time
yum install chrony
systemctl start chronyd
systemctl enable chronyd
