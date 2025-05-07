paru -S --noconfirm --needed flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Brightness control
paru -S --noconfirm --needed brightnessctl

# Provides a system clipboard interface
paru -S --noconfirm --needed wl-clipboard

# Bluetooth
paru -S --noconfirm --needed bluez bluez-utils

# Media player
paru -S --noconfirm --needed playerctl vlc
