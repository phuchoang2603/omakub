#!/bin/bash

# Log all output
exec > >(tee -a ~/.local/share/omakub/install.log) 2>&1

echo "🚀 Starting Omakub installation..."

# Install terminal tools (all required, no prompts except user info + language selection)
source ~/.local/share/omakub/install/terminal.sh

# Install desktop tools (core + optional selection)
source ~/.local/share/omakub/install/desktop.sh
