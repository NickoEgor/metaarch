cat <<EOF | fdisk /dev/sda
n
p



w
EOF
yes | mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab
curl https://raw.githubusercontent.com/NickoEgor/metaarch/master/chroot.sh > /mnt/chroot.sh && arch-chroot /mnt bash chroot.sh && rm /mnt/chroot.sh
umount /mnt
# shutdown -h now
