# Fusuma is a multi-touch gesture recognizer for Linux. https://github.com/iberianpig/fusuma

sudo gpasswd -a $USER input
sg input <<EOF
sudo apt install -y libinput-tools libevdev-dev ruby-dev
sudo apt install -y ruby
sudo gem install -y fusuma
gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled

# install fusuma-plugin-sendkey. https://github.com/iberianpig/fusuma-plugin-sendkey
sudo gem install revdev
sudo gem install bundler
sudo gem install fusuma-plugin-sendkey

# copy configuration files
mkdir -p ~/.config/fusuma
cp -r ~/.local/share/omakub/configs/fusuma/* ~/.config/fusuma/

# copy autostart file
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/autostart/fusuma.desktop ~/.config/autostart/fusuma.desktop
EOF