if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed visual-studio-code-bin
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  cd /tmp || return 1
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
  rm -f packages.microsoft.gpg
  cd - || return 1

  sudo apt update -y
  sudo apt install -y code
fi
