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

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
  # Use LazyVim
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  # Remove the .git folder, so you can add it to your own repo later
  rm -rf ~/.config/nvim/.git

  # Make everything match the terminal transparency
  mkdir -p ~/.config/nvim/plugin/after
  cp ~/.local/share/omakub/configs/nvim/transparency.lua ~/.config/nvim/plugin/after/

  # Default to Tokyo Night theme
  cp ~/.local/share/omakub/themes/tokyo-night/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  # Add symbolic link to LazyVim configuration
  ln -sf ~/.local/share/omakub/configs/nvim/lazyvim.json ~/.config/nvim/lazyvim.json
  ln -sf ~/.local/share/omakub/configs/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
  ln -sf ~/.local/share/omakub/configs/nvim/lua/config/options.lua ~/.config/nvim/lua/config/options.lua
  # Plugin configuration
  ln -sf ~/.local/share/omakub/configs/nvim/lua/plugins/built-in.lua ~/.config/nvim/lua/plugins/built-in.lua
  ln -sf ~/.local/share/omakub/configs/nvim/lua/plugins/third-party-plugins.lua ~/.config/nvim/lua/plugins/third-party-plugins.lua
fi
