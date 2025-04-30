#!/bin/bash

# Get all available optional installers
INSTALLER_DIR=~/.local/share/omakub/install/optional
INSTALLERS=()
INSTALLER_NAMES=()

# Populate arrays with installer paths and names
for installer in "$INSTALLER_DIR"/*.sh; do
    if [ -f "$installer" ]; then
        INSTALLERS+=("$installer")
        # Extract filename without path and extension
        name=$(basename "$installer" .sh)
        INSTALLER_NAMES+=("$name")
    fi
done

if [ ${#INSTALLERS[@]} -eq 0 ]; then
    echo "No optional installers found in $INSTALLER_DIR"
    exit 0
fi

# Use gum choose to select installers - pass array directly
selected=$(gum choose "${INSTALLER_NAMES[@]}" --selected='*' --no-limit --height 15 --header "Optional Applications")

# Exit if nothing was selected
if [ -z "$selected" ]; then
    echo "No applications selected. Exiting."
    return 0 2>/dev/null || exit 0 # Return if sourced, exit if executed directly
fi

echo "Installing selected applications..."

# Process each selected installer
for name in $selected; do
    installer="$INSTALLER_DIR/$name.sh"
    if [ -f "$installer" ]; then
        echo "Running installer for: $name"
        source "$installer"
    else
        echo "Installer not found: $name"
    fi
done

echo "Optional installation complete!"
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot

