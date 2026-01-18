if command -v opencode &>/dev/null; then
  echo "OpenCode is already installed."
else
  npm install -g opencode-ai
  paru -S --noconfirm --needed lsof
fi
