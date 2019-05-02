instcmd="pacman --noconfirm --needed -S"

# install X.Org Server
sudo $instcmd xorg

# install i3 window manager and addons
sudo $instcmd i3-gaps i3blocks i3lock

# install user configuration
cp -r ~/metaarch/home/. ~/
