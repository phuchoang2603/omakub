if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed flatpak
  paru -S --noconfirm --needed brightnessctl wl-clipboard bluez bluez-utils playerctl vlc

elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y flatpak
  sudo apt install -y brightnessctl wl-clipboard playerctl vlc
fi

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
