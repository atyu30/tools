#Install
xzcat CentOS-Userland-7-armv7hl-Minimal-1511-CubieTruck.img.xz | dd of=/dev/mmcblk0 status=progress bs=4M

#Settings
##Default User/Password
root/centos
##Time
yum install chrony
systemctl start chronyd
systemctl enable chronyd


##Service
systemctl stop firewalld
systemctl disable firewalld
systemctl disable NetworkManager
systemctl stop postfix
systemctl disable postfix
