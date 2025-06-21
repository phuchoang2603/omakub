# OBS Studio is a screen recording application that allows you to capture both display and webcam in the same recording
if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed obs-studio
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y obs-studio
fi
