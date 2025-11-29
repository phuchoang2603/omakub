if command -v atuin &>/dev/null; then
  echo "atuin is already installed."
else
  cargo install atuin
fi
