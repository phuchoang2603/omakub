# Libinput is a library that handles input devices in Wayland and X11. Fix touchpad scrolling way too fast

mkdir -p ~/repos/
git clone https://gitlab.com/warningnonpotablewater/libinput-config.git ~/repos/libinput-config
cd ~/repos/libinput-config

sudo apt-get install -y libinput ninja-build meson

# copy the config file to the right place
sudo cp ~/.local/share/omakub/configs/libinput.conf /etc/libinput.conf

# build the project
meson build
cd build
ninja
sudo ninja install