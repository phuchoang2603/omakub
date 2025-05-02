# Stream music using https://spotify.com
paru -S --noconfirm --needed spotify

mkdir -p ~/repos/
if [ ! -d "$HOME/repos/spotify-adblock" ]; then
  git clone https://github.com/abba23/spotify-adblock.git "$HOME/repos/spotify-adblock"
else
  echo "Spotify Adblock is already cloned at $HOME/repos/spotify-adblock"
fi
cd ~/repos/spotify-adblock
make
sudo make install

mkdir -p ~/.local/share/applications

cat >~/.local/share/applications/spotify-adblock.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Spotify (adblock)
GenericName=Music Player
Icon=spotify-client
TryExec=spotify
Exec=env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify
EOF

cd -
