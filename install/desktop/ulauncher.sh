gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] http://ppa.launchpad.net/agornostal/ulauncher/ubuntu noble main" | sudo tee /etc/apt/sources.list.d/ulauncher-noble.list

sudo apt update -y
sudo apt install -y ulauncher

# Install extension dependencies
# for media-player-control
sudo apt install -y playerctl
# for calculate-anything
pip3 install Pint simpleeval parsedatetime pytz babel --break-system-packages
# for vscode-recent
pip3 install fuzzywuzzy --break-system-packages

mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/autostart/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
ln -s ~/.local/share/omakub/configs/ulauncher ~/.config/ulauncher
