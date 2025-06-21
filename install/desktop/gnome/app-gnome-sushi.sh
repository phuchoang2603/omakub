if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed sushi
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y gnome-sushi
fi
