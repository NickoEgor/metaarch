instcmd="pacman --noconfirm --needed -S"

# to get user name and password
$instcmd dialog

getuserandpass() {
    # Prompts user for new username an password.
    name=$(dialog --inputbox "First, please enter a name for the user account." 10 60 3>&1 1>&2 2>&3 3>&1) || exit
    while ! echo "$name" | grep "^[a-z_][a-z0-9_-]*$" >/dev/null 2>&1; do
        name=$(dialog --no-cancel --inputbox "Username not valid. Give a username beginning with a letter, with only lowercase letters, - or _." 10 60 3>&1 1>&2 2>&3 3>&1)
    done
    pass1=$(dialog --no-cancel --passwordbox "Enter a password for that user." 10 60 3>&1 1>&2 2>&3 3>&1)
    pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
    while ! [ "$pass1" = "$pass2" ]; do
        unset pass2
        pass1=$(dialog --no-cancel --passwordbox "Passwords do not match.\\n\\nEnter password again." 10 60 3>&1 1>&2 2>&3 3>&1)
        pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
    done
}

# Get and verify username and password.
getuserandpass || exit

groupadd sudo
useradd -m -g users -G sudo,wheel,storage,video,audio,power -s /bin/bash "$name"
sed -i 's/.\+\(%sudo.\+\)/\1/' /etc/sudoers

echo "$name:$pass1" | chpasswd

# install and enable audio driver
$instcmd alsa-lib alsa-utils
amixer sset Master on

# video driver
$instcmd xf86-video-intel mesa mesa-demos 

# input devices driver
$instcmd xf86-input-libinput

# install advanced power/configuration interface
$instcmd acpi acpid
systemctl enable acpid.service

$instcmd bash-completion linux-headers python3
# bash-completion - autocompletes user commands in bash
# linux-headers - needed for compiling linux programs
# python3 - needed to run a lot of programs
