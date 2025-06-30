if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed libreoffice-fresh
  paru -S --noconfirm --needed ttf-ms-fonts
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y libreoffice
  sudo apt install -y ttf-mscorefonts-installer
fi
