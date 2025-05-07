# Hyprland + Theming + App Support
packages=(
  hyprland
  hyprpaper
  hyprlock
  hypridle
  hyprpolkitagent
  waybar
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk
  nwg-look
  nwg-displays
  libadwaita
  qt5-wayland
  qt6-wayland
  qt5ct
  qt6ct
  libnotify
  swaync
  network-manager-applet
  uwsm
)

paru -S --noconfirm --needed "${packages[@]}"
