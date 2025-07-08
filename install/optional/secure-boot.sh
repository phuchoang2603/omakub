if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed sbctl
  sudo -i
  sbctl create-keys
  sbctl enroll-keys --microsoft

  sbctl verify | sed 's/✗ /sbctl sign -s /e'
  sbctl status
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  true
fi
