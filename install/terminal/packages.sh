#!/bin/bash

source ~/.local/share/omakub/install/lib/installer.sh

# Terminal packages (ALL REQUIRED)
# Format: "command_name:package1 package2 package3"
TERMINAL_PACKAGES=(
  "nvim:neovim tree-sitter luarocks"
  "lazygit:lazygit"
  "yazi:yazi"
  "gh:github-cli"
  "fastfetch:fastfetch"
  "starship:starship"
  "atuin:atuin"
  "opencode:opencode-bin"
  "fzf:fzf"
  "rg:ripgrep"
  "fd:fd"
  "bat:bat"
  "eza:eza"
  "zoxide:zoxide"
  "jq:jq"
  "tree:tree"
  "btop:btop"
  "magick:imagemagick"
  "tmux:tmux"
  "docker:docker docker-compose"
  "lazydocker:lazydocker"
  "kubectl:kubectl"
  "krew:krew"
  "helm:helm"
  "kubectx:kubectx"
  "vault:vault"
)

echo "📦 Installing terminal packages..."

# Install all terminal packages via paru
for app_def in "${TERMINAL_PACKAGES[@]}"; do
  IFS=':' read -r cmd packages <<<"$app_def"
  install_if_missing "$cmd" $packages
done

# Post-install: Enable Docker service and add user to docker group
if command -v docker &>/dev/null; then
  sudo systemctl enable --now docker.service
  sudo usermod -aG docker ${USER}
fi

echo "✅ Terminal packages installed"
