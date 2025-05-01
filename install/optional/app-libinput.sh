# Libinput is a library that handles input devices in Wayland and X11. Fix touchpad scrolling way too fast

mkdir -p ~/repos/
git clone https://gitlab.com/warningnonpotablewater/libinput-config.git ~/repos/libinput-config

sudo apt-get install -y libinput-dev ninja-build meson

sudo cp ~/.config/libinput.conf /etc/libinput.conf

# build the project
cd ~/repos/libinput-config
meson build
cd -
cd ~/repos/libinput-config/build
ninja
sudo ninja install
cd -
