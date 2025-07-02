# Theming + App Support
packages=(
  libadwaita
  kvantum-qt5
  qt5-wayland
  qt6-wayland
  qt5ct
  qt6ct
  gnome-themes-extra
)

paru -S --noconfirm --needed "${packages[@]}"

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
