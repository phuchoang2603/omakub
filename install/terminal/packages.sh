#!/bin/bash

source ~/.local/share/omakub/install/lib/installer.sh

TERMINAL_PACKAGES=(
  "neovim:neovim tree-sitter luarocks opencode"
  "python: python pipx"
  "git-tools:lazygit gh"
  "monitoring:fastfetch btop"
  "shell:zsh-completions starship atuin"
  "search-tools:fzf ripgrep fd bat eza zoxide"
  "file-manager:yazi ffmpegthumbnailer poppler imagemagick"
  "utils:rclone man-db jq todoist-cli"
  "tmux:tmux sesh gitmux"
  "docker:docker docker-compose lazydocker"
  "kubernetes:kubectl krew helm kubectx"
)

echo "📦 Installing terminal packages via Homebrew..."

for app_def in "${TERMINAL_PACKAGES[@]}"; do
  IFS=':' read -r group_name packages <<<"$app_def"
  echo "→ Installing $group_name: $packages"
  brew_pkg $packages
done

echo "✅ Terminal packages installed"
