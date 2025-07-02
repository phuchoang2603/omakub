packages=(
  rofi-wayland
  papirus-icon-theme
  rofi-calc
)

paru -Rns --noconfirm rofi rofi-calc
paru -S --noconfirm --needed "${packages[@]}"
