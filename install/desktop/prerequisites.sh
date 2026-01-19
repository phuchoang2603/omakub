paru -S --noconfirm --needed flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

paru -S --noconfirm --needed network-manager-applet brightnessctl wl-clipboard bluez bluez-utils blueman playerctl mpv pavucontrol wireplumber tumbler
sudo systemctl enable --now bluetooth.service
