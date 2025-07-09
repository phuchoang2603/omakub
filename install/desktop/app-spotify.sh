if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed spotify-launcher
  spotify-launcher
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
  echo "deb [signed-by=/etc/apt/trusted.gpg.d/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt update -y
  sudo apt install -y spotify-client
fi

# Spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
