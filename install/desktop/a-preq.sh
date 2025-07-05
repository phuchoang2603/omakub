if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed flatpak
  paru -S --noconfirm --needed preload brightnessctl wl-clipboard wl-clip-persist bluez bluez-utils playerctl vlc pavucontrol wireplumber tumbler
  sudo systemctl enable --now preload.service
  sudo systemctl enable --now bluetooth.service
  # brotab
  pipx install brotab
  bt install

elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y flatpak
  sudo apt install -y brightnessctl wl-clipboard playerctl vlc tumbler
  # brotab
  pipx install brotab
  bt install
fi

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
