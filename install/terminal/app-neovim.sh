if command -v nvim &>/dev/null; then
  echo "Neovim is already installed."
else
  paru -S --noconfirm --needed \
    neovim \
    tree-sitter \
    luarocks
fi
