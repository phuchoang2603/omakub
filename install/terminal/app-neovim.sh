if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed \
    neovim \
    tree-sitter \
    luarocks

elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  cd /tmp || return
  wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
  tar -xf nvim.tar.gz
  sudo install nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  sudo cp -R nvim-linux-x86_64/lib /usr/local/
  sudo cp -R nvim-linux-x86_64/share /usr/local/
  rm -rf nvim-linux-x86_64 nvim.tar.gz
  cd - || return

  # Install luarocks and tree-sitter-cli to resolve lazyvim :checkhealth warnings
  sudo apt install -y luarocks tree-sitter-cli

fi
