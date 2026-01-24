#!/bin/bash

source ~/.local/share/omakub/install/lib/installer.sh

# Terminal packages (ALL REQUIRED)
# Format: "command_name:package1 package2 package3"
TERMINAL_PACKAGES=(
  "nvim:neovim tree-sitter luarocks"
  "lazygit:lazygit"
  "yazi:yazi"
  "gh:gh"
  "fastfetch:fastfetch"
  "starship:starship"
  "atuin:atuin"
  "opencode:opencode"
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
  "sesh:sesh"
  "gitmux:gitmux"
  "docker:docker docker-compose"
  "lazydocker:lazydocker"
  "kubectl:kubectl"
  "krew:krew"
  "helm:helm"
  "kubectx:kubectx"
  "vault:vault"
)

echo "📦 Installing terminal packages via Homebrew..."

# Install all terminal packages via brew
for app_def in "${TERMINAL_PACKAGES[@]}"; do
  IFS=':' read -r cmd packages <<<"$app_def"
  brew_install_if_missing "$cmd" $packages
done

echo "✅ Terminal packages installed"
