# Log all output to a file
exec > >(tee -a ~/.local/share/omakub/install.log) 2>&1

# Exit immediately if a command exits with a non-zero status
set -e

# Detect the operating system
if [ -f "/etc/os-release" ]; then
  . /etc/os-release
  OMAKUB_OS_ID=$ID
else
  OMAKUB_OS_ID="unknown"
fi
export OMAKUB_OS_ID

echo "Installing terminal and desktop tools..."

# Install terminal tools
source ~/.local/share/omakub/install/terminal.sh

# Install desktop tools and tweaks
source ~/.local/share/omakub/install/desktop.sh
