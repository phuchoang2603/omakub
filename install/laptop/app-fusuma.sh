# Fusuma is a multi-touch gesture recognizer for Linux. https://github.com/iberianpig/fusuma

sudo gpasswd -a $USER input
sg input <<EOF
sudo apt install -y libinput-tools libevdev-dev ruby-dev
sudo apt install -y ruby
sudo gem install fusuma
gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled

# install fusuma-plugin-sendkey. https://github.com/iberianpig/fusuma-plugin-sendkey
sudo gem install revdev
sudo gem install bundler
sudo gem install fusuma-plugin-sendkey

# create symbolic links for configuration files
mkdir -p ~/.config/fusuma
ln -sf ~/.local/share/omakub/configs/fusuma/config.yml ~/.config/fusuma/config.yml

# copy autostart file
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/autostart/fusuma.desktop ~/.config/autostart/fusuma.desktop
EOF

# Run patch-gnome-shell-finger-count.py
sudo python3 ~/.local/share/omakub/configs/fusuma/patch-gnome-shell-finger-count.py