sudo apt install -y tmux

# Create config directory
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

go install github.com/joshmedeski/sesh/v2@latest
go install github.com/arl/gitmux@latest

tmux source-file "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" || true
