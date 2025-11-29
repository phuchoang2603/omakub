# Display system information in the terminal
if command -v fastfetch &>/dev/null; then
  echo "fastfetch is already installed."
else
  if [ "$OMAKUB_OS_ID" == "arch" ]; then
    paru -S --noconfirm --needed fastfetch
  elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
    sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
    sudo apt update -y
    sudo apt install -y fastfetch
  fi
fi
