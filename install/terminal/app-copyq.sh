# CopyQ is a clipboard manager with advanced features.
sudo add-apt-repository -y ppa:hluk/copyq
sudo apt update -y
sudo apt install -y copyq

# Copy configuration files
mkdir -p ~/.config/copyq
cp -r ~/.local/share/omakub/configs/copyq/* ~/.config/copyq/

# Start CopyQ on login
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/autostart/copyq.desktop ~/.config/autostart/copyq.desktop