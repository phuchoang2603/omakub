packages=(
  rofi-wayland
  papirus-icon-theme
  rofi-calc
  rofi-emoji
)

paru -R --noconfirm rofi rofi-calc rofi-emoji
paru -S --noconfirm --needed "${packages[@]}"
