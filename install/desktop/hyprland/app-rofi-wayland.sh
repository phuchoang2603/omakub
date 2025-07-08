packages=(
  rofi-wayland
  rofi-calc
)

paru -Rns --noconfirm rofi rofi-calc
paru -S --noconfirm --needed "${packages[@]}"
