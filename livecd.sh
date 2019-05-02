# create disk partition for system
cat <<EOF | fdisk /dev/sda
n
p



w
EOF

# format partition as ext4
yes | mkfs.ext4 /dev/sda1

# mount partition
mount /dev/sda1 /mnt

# install arch packages on partition
pacstrap /mnt base base-devel

# generate fstab file for automounting
genfstab -U /mnt >> /mnt/etc/fstab

# run script to setup system
curl https://raw.githubusercontent.com/NickoEgor/metaarch/master/chroot.sh > /mnt/chroot.sh && arch-chroot /mnt bash chroot.sh && rm /mnt/chroot.sh

# unmount partition
umount /mnt

# reboot livecd to run new system
reboot
