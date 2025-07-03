packages=(
  hyprland
  hyprshot
  hyprlock
  hypridle
  hyprsunset
  hyprpolkitagent
  hyprland-qtutils
  hyprpaper
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk
  waybar
  mako
  uwsm
)

paru -S --noconfirm --needed "${packages[@]}"
paru -S --noconfirm copyq
