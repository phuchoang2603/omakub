if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed tmux
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y tmux
fi

# Install TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo "TPM is already installed at $HOME/.tmux/plugins/tpm"
fi
go install github.com/joshmedeski/sesh/v2@latest
go install github.com/arl/gitmux@latest
