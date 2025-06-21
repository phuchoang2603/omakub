if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed libreoffice-fresh
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y libreoffice
fi
