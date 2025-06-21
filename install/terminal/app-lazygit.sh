if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed lazygit
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  cd /tmp || return
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar -xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  rm lazygit.tar.gz lazygit
  cd - || return
fi
