instcmd="pacman --noconfirm --needed -S"

# install X.Org Server
sudo $instcmd xorg xorg-xinit xterm

# install i3 window manager and addons
sudo $instcmd i3-gaps i3blocks i3lock

# install terminal
sudo $instcmd make fontconfig
git clone https://github.com/NickoEgor/st
cd st
make
sudo make install
cd ..
rm -rf st/

# install text editor, browser, notifications, screenshots, 
# wallpapers, video player, file manager, image viewer, composite manager and other
sudo $instcmd gvim qutebrowser dunst scrot xwallpaper mpv vifm sxiv compton dmenu

# install music player
sudo $instcmd mpd mpc ncmpcpp
systemctl --user enable mpd.service
systemctl --user start mpd.service

# install cron
sudo $instcmd cronie
sudo systemctl enable cronie.service
sudo systemctl start cronie.service
cronfile="cronfile"
echo '* * * * * /home/george/.scripts/i3mpdupdate' > "$cronfile"
crontab "$cronfile"
rm "$cronfile"

# install pdf/djvu reader
sudo $instcmd zathura zathura-pdf-mupdf zathura-djvu

# install office
sudo $instcmd libreoffice-fresh

# install fonts
sudo $instcmd noto-fonts-emoji

# useful features
sudo $instcmd youtube-dl

# mounting mtp filesystems
sudo $instcmd libmtp
git clone https://github.com/phatina/simple-mtpfs
cd simple-mtpfs
./autogen.sh
mkdir build && cd build
../configure
make
sudo make install

# install user configuration
cp -r ~/metaarch/home/. ~/
chmod +x ~/.scripts/*
