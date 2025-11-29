if ! command -v tmux &>/dev/null; then
  if [ "$OMAKUB_OS_ID" == "arch" ]; then
    paru -S --noconfirm --needed tmux
  elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
    sudo apt install -y tmux
  fi
else
  echo "tmux is already installed."
fi

# Install TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo "TPM is already installed at $HOME/.tmux/plugins/tpm"
fi

# Install sesh and gitmux
if ! command -v sesh &>/dev/null; then
  go install github.com/joshmedeski/sesh/v2@latest
else
  echo "sesh is already installed."
fi

if ! command -v gitmux &>/dev/null; then
  go install github.com/arl/gitmux@latest
else
  echo "gitmux is already installed."
fi
