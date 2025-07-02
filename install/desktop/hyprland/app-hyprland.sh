packages=(
  hyprland
  hyprshot
  hyprlock
  hypridle
  hyprpolkitagent
  hyprland-qtutils
  hyprpaper
  cliphist
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk
  waybar
  mako
  uwsm
)

paru -Rns --noconfirm copyq
paru -S --noconfirm --needed "${packages[@]}"
