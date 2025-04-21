# Filecxx Download manager
mkdir -p ~/repos/
wget -O ~/repos/filecxx.zip "https://github.com/filecxx/FileCentipede/releases/download/v2.82.0/filecxx_2.82_linux_x64.zip"
unzip ~/repos/filecxx.zip -d ~/repos/filecxx
rm ~/repos/filecxx.zip

# Create symlinks
sudo ln -sf ~/repos/filecxx/filec /usr/local/bin/filec
sudo ln -sf ~/repos/filecxx/fileu /usr/local/bin/fileu

# Copy data_linux.db to ~/repos/filecxx/lib
cp ~/.local/share/omakub/configs/filecxx/data_linux.db ~/repos/filecxx/lib/

# Copy autostart file
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/autostart/filecxx.desktop ~/.config/autostart/filecxx.desktop

sudo fileu