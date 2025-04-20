# CopyQ is a clipboard manager with advanced features.
sudo add-apt-repository ppa:hluk/copyq
sudo apt update -y
sudo apt install -y copyq

# Only attempt to set configuration if CopyQ is not already set
if [ ! -f "$HOME/.config/copyq/copyq.conf" ]; then
  # Use Omakub CopyQ config
  mkdir -p ~/.config/copyq
  cp ~/.local/share/omakub/configs/copyq/* ~/.config/copyq/
fi

# Start CopyQ on login
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/autostart/copyq.desktop ~/.config/autostart/copyq.desktop