# Log all output to a file
exec > >(tee -a ~/.local/share/omakub/install.log) 2>&1

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Omakub installation failed! You can retry by running: source ~/.local/share/omakub/install.sh"' ERR

echo "Installing terminal and desktop tools..."

# Install terminal tools
source ~/.local/share/omakub/install/terminal.sh

# Install desktop tools and tweaks
source ~/.local/share/omakub/install/desktop.sh
