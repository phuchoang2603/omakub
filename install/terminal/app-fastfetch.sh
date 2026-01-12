# Display system information in the terminal
if command -v fastfetch &>/dev/null; then
  echo "fastfetch is already installed."
else
  paru -S --noconfirm --needed fastfetch
fi
