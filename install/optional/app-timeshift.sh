if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed timeshift grub-btrfs
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo add-apt-repository -y ppa:teejee2008/timeshift
  sudo apt-get update
  sudo apt-get install timeshift
fi
