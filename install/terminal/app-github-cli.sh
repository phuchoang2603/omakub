if command -v gh &>/dev/null; then
  echo "GitHub CLI is already installed."
else
  paru -S --noconfirm --needed github-cli
fi
