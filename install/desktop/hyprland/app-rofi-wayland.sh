packages=(
  rofi-wayland
  papirus-icon-theme
  rofi-calc
)

paru -R --noconfirm rofi rofi-calc
paru -S --noconfirm --needed "${packages[@]}"
