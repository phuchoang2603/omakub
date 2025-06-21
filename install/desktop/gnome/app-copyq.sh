if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed copyq
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo add-apt-repository -y ppa:hluk/copyq
  sudo apt update -y
  sudo apt install -y copyq
fi
