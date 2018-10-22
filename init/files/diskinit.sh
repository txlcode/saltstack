#!/bin/bash
#
fdisk -l
read -p "Plase input disk: " USER_LIST
echo "n
p
1


w" | fdisk $USER_LIST &> /dev/null
sleep 2
#格式化
mkfs.ext4 ${USER_LIST}1 &> /dev/null
#挂载
if [ ! -d /data ];then
	mkdir /data
fi
mount ${USER_LIST}1 /data

#设置开机自启动
echo -e "/dev/vdb1\t\t\t/data\text4\tdefaults\t1 2" >> /etc/fstab
