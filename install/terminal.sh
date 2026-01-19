#!/bin/bash

# Prompt for user info
read -p "Enter GitHub username: " OMAKUB_USER_NAME
export OMAKUB_USER_NAME
read -p "Enter email address: " OMAKUB_USER_EMAIL
export OMAKUB_USER_EMAIL

# Install mise + languages FIRST (cargo needed for some packages like atuin)
source ~/.local/share/omakub/install/terminal/required/dev-languages.sh

# Install base system packages
source ~/.local/share/omakub/install/terminal/required/base-packages.sh

# Symlink dotfiles
source ~/.local/share/omakub/dotfiles/symlink.sh

# Configure git
source ~/.local/share/omakub/install/terminal/required/git-config.sh

# Install all terminal packages
source ~/.local/share/omakub/install/terminal/packages.sh

# Report errors
source ~/.local/share/omakub/install/lib/installer.sh
report_errors

echo "✅ Terminal setup complete!"
