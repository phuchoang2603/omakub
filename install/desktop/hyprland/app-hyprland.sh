packages=(
  hyprland
  hyprshot
  hyprlock
  hypridle
  hyprpolkitagent
  hyprland-qtuils
  hyprpaper
  cliphist
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk
  waybar
  mako
  network-manager-applet
)

paru -S --noconfirm --needed "${packages[@]}"
