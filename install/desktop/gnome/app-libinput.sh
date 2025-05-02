# Libinput is a library that handles input devices in Wayland and X11. Fix touchpad scrolling way too fast

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
