# Libinput is a library that handles input devices in Wayland and X11. Fix touchpad scrolling way too fast
paru -S --noconfirm --needed libinput

mkdir -p ~/repos/
if [ ! -d "$HOME/repos/libinput-config" ]; then
  git clone https://gitlab.com/warningnonpotablewater/libinput-config.git "$HOME/repos/libinput-config"
else
  echo "Libinput Config is already cloned at $HOME/repos/libinput-config"
fi

sudo cp ~/.config/libinput.conf /etc/libinput.conf

# build the project
cd ~/repos/libinput-config
meson build
cd -
cd ~/repos/libinput-config/build
ninja
sudo ninja install
cd -

# Fusuma is a multi-touch gesture recognizer for Linux. https://github.com/iberianpig/fusuma
sudo gpasswd -a $USER input
paru -S --noconfirm --needed ruby-fusuma ruby-fusuma-plugin-sendkey

gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled

# Run patch-gnome-shell-finger-count.py
sudo python3 ~/.config/fusuma/patch-gnome-shell-finger-count.py
