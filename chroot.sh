echo "root:pass" | chpasswd
ln -sf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "arch" > /etc/hostname
passwd
pacman --noconfirm --needed -S networkmanager
systemctl enable NetworkManager
pacman --noconfirm --needed -S grub && grub-install --target=i386-pc /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -p linux
