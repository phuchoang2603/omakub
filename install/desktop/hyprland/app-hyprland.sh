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

systemctl --user enable --now hypridle.service
systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hyprsunset.service
systemctl --user enable --now mako.service
systemctl --user enable --now waybar.service
