if command -v lazygit &>/dev/null; then
  echo "lazygit is already installed."
else
  paru -S --noconfirm --needed lazygit
fi
