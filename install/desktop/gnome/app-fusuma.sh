# Fusuma is a multi-touch gesture recognizer for Linux. https://github.com/iberianpig/fusuma

sudo gpasswd -a $USER input
sg input <<EOF
sudo gem install fusuma
gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled

# install fusuma-plugin-sendkey. https://github.com/iberianpig/fusuma-plugin-sendkey
sudo gem install revdev
sudo gem install bundler
sudo gem install fusuma-plugin-sendkey
EOF

# Run patch-gnome-shell-finger-count.py
sudo python3 ~/.config/fusuma/patch-gnome-shell-finger-count.py
