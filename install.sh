# Log all output to a file
exec > >(tee -a ~/.local/share/omakub/install.log) 2>&1

echo "Installing terminal and desktop tools..."

# Install terminal tools
source ~/.local/share/omakub/install/terminal.sh

# Install desktop tools and tweaks
source ~/.local/share/omakub/install/desktop.sh
