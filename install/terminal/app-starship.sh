# Starship is a cross-shell prompt that is fast, easy to customize, and works on any shell.
if command -v starship &>/dev/null; then
  echo "Starship is already installed."
else
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi