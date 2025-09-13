paru -S --noconfirm --needed flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

paru -S --noconfirm --needed brightnessctl wl-clipboard bluez bluez-utils blueman playerctl mpv pavucontrol wireplumber tumbler
sudo systemctl enable --now bluetooth.service

# ff2mpv
git clone https://github.com/woodruffw/ff2mpv.git --depth 1 ~/repos/ff2mpv
source ~/repos/ff2mpv/install.sh firefox
