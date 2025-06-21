if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed gnome-tweaks

  # Fix shebang in /usr/bin/gnome-tweaks if necessary
  TWEAKS_PATH="/usr/bin/gnome-tweaks"
  if [[ -f "$TWEAKS_PATH" ]]; then
    sudo sed -i '1s|^#!/usr/bin/env python3$|#!/usr/bin/python3|' "$TWEAKS_PATH"
    echo "Updated shebang in $TWEAKS_PATH"
  else
    echo "gnome-tweaks not found at $TWEAKS_PATH"
  fi

elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y gnome-tweak-tool
fi
