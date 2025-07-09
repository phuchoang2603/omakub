# Log all output to a file
exec > >(tee -a ~/.local/share/omakub/install.log) 2>&1

source ~/.local/share/omakub/check-os.sh

read -p "Enter github username: " OMAKUB_USER_NAME
export OMAKUB_USER_NAME

read -p "Enter email address: " OMAKUB_USER_EMAIL
export OMAKUB_USER_EMAIL

echo "Installing terminal and desktop tools..."

# Install terminal tools
source ~/.local/share/omakub/install/terminal.sh

# Install desktop tools and tweaks
source ~/.local/share/omakub/install/desktop.sh
