paru -S --noconfirm --needed tmux

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

go install github.com/joshmedeski/sesh/v2@latest
go install github.com/arl/gitmux@latest
