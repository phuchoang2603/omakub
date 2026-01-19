#!/bin/bash

# Configure git
source ~/.local/share/omakub/install/terminal/required/git-config.sh

# Install Arch prerequisites (paru, chaotic-aur, gum)
source ~/.local/share/omakub/install/terminal/required/arch-prerequisites.sh

# Install mise + languages
source ~/.local/share/omakub/install/terminal/required/dev-languages.sh

# Symlink dotfiles
source ~/.local/share/omakub/dotfiles/symlink.sh

# Install all terminal packages
source ~/.local/share/omakub/install/terminal/packages.sh

# Report errors
source ~/.local/share/omakub/install/lib/installer.sh
report_errors

echo "✅ Terminal setup complete!"
