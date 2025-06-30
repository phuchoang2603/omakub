# Log all output to a file
exec > >(tee -a ~/.local/share/omakub/install.log) 2>&1

# Exit immediately if a command exits with a non-zero status
set -e

source ~/.local/share/omakub/check-os.sh

echo "Installing terminal and desktop tools..."

# Install terminal tools
source ~/.local/share/omakub/install/terminal.sh

# Install desktop tools and tweaks
source ~/.local/share/omakub/install/desktop.sh
