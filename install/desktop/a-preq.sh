if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed flatpak
  paru -S --noconfirm --needed brightnessctl wl-clipboard bluez bluez-utils playerctl vlc
  paru -S --noconfirm --needed noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-ms-fonts

elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y flatpak
  sudo apt install -y brightnessctl wl-clipboard playerctl vlc
  sudo apt install -y fonts-noto fonts-noto-color-emoji fonts-noto-cjk fonts-recommended ttf-mscorefonts-installer
fi

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
