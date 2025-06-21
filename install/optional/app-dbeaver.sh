if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed dbeaver
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo add-apt-repository ppa:serge-rider/dbeaver-ce
  sudo apt-get update
  sudo apt-get install -y dbeaver-ce
fi
