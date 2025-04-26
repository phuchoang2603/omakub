sudo apt install -y tmux

# Create config directory
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"

# Create symbolic links
ln -sf "$HOME/.local/share/omakub/configs/tmux/tmux.conf" "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
ln -sf "$HOME/.local/share/omakub/configs/tmux/tmux.reset.conf" "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.reset.conf"

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

tmux source-file "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" || true
