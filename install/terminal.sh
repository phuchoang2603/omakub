#!/bin/bash

# Configure git (prompts for username/email)
source ~/.local/share/omakub/install/terminal/required/git-config.sh

# Symlink dotfiles (includes Homebrew in PATH via .zshrc)
source ~/.local/share/omakub/dotfiles/symlink.sh

# Install prerequisites (Homebrew, paru, system packages)
source ~/.local/share/omakub/install/terminal/required/arch-prerequisites.sh

# Install mise + languages (Node, Python, Go, Rust)
source ~/.local/share/omakub/install/terminal/required/dev-languages.sh

# Install all terminal packages via Homebrew
source ~/.local/share/omakub/install/terminal/packages.sh

# Report errors
source ~/.local/share/omakub/install/lib/installer.sh
report_errors

echo "✅ Terminal setup complete!"
