if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed ulauncher-git
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
  gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg >/dev/null
  echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] http://ppa.launchpad.net/agornostal/ulauncher/ubuntu noble main" | sudo tee /etc/apt/sources.list.d/ulauncher-noble.list

  sudo apt update -y
  sudo apt install -y ulauncher

  # for calculate-anything
  pip3 install Pint simpleeval parsedatetime pytz babel --break-system-packages
  # for vscode-recent
  pip3 install fuzzywuzzy --break-system-packages
fi

systemctl --user enable --now ulauncher
