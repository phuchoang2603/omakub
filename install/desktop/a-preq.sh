paru -S --noconfirm --needed flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

paru -S --noconfirm --needed brightnessctl wl-clipboard bluez bluez-utils playerctl vlc pavucontrol wireplumber tumbler
sudo systemctl enable --now bluetooth.service

# brotab
pipx install brotab
bt install
