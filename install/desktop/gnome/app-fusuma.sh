# Fusuma is a multi-touch gesture recognizer for Linux. https://github.com/iberianpig/fusuma

sudo gpasswd -a $USER input
paru -S --noconfirm --needed ruby-fusuma ruby-fusuma-plugin-sendkey

gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled

# Run patch-gnome-shell-finger-count.py
sudo python3 ~/.config/fusuma/patch-gnome-shell-finger-count.py
