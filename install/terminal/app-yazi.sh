if command -v yazi &>/dev/null; then
  echo "Yazi is already installed."
else
  paru -S --noconfirm --needed yazi
fi
