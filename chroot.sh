password="pass"

# set password for root user
echo "root:$password" | chpasswd

# set time zone
ln -sf /usr/share/zoneinfo/Europe/Minsk /etc/localtime

# sync hardware clock with system
hwclock --systohc

# set system locale
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# set machine hostname
echo "arch" > /etc/hostname

# install and enable networkmanager to control network connection
pacman --noconfirm --needed -S networkmanager
systemctl enable NetworkManager

# install grub to run new system
pacman --noconfirm --needed -S grub && grub-install --target=i386-pc /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg

# create initramfs
mkinitcpio -p linux
