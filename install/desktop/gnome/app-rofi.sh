if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -Rns --noconfirm rofi-wayland rofi-calc
  paru -S --noconfirm --needed \
    rofi rofi-calc
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y \
    rofi rofi-dev qalc
  git clone https://github.com/svenstaro/rofi-calc.git ~/repos/rofi-calc
  cd ~/repos/rofi-calc || return 1
  meson setup build
  meson compile -C build/
  meson install
  cd - || return 1
fi
