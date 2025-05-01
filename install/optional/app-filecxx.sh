# Filecxx Download manager
mkdir -p ~/repos/
wget -O ~/repos/filecxx.zip "https://github.com/filecxx/FileCentipede/releases/download/v2.82.0/filecxx_2.82_linux_x64.zip"
unzip ~/repos/filecxx.zip -d ~/repos/filecxx
rm ~/repos/filecxx.zip

# Copy data_linux.db to ~/repos/filecxx/lib
cp ~/.config/filecxx/data_linux.db ~/repos/filecxx/lib/

# Run fileu and wait for user to complete GUI installation
sudo fileu
echo "Press Enter after completing the installation in the GUI..."
read -r
