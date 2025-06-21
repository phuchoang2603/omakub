if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed \
    rofi papirus-icon-theme rofi-calc
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo add-apt-repository ppa:papirus/papirus
  sudo apt-get update
  sudo apt install -y \
    rofi papirus-icon-theme rofi-dev qalc
  git clone https://github.com/svenstaro/rofi-calc.git ~/repos/rofi-calc
  cd ~/repos/rofi-calc || return 1
  meson setup build
  meson compile -C build/
  meson install
  cd - || return 1
fi
