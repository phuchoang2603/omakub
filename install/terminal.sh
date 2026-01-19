read -p "Enter github username: " OMAKUB_USER_NAME
export OMAKUB_USER_NAME

read -p "Enter email address: " OMAKUB_USER_EMAIL
export OMAKUB_USER_EMAIL

# Install paru if not already installed
if ! command -v paru &>/dev/null; then
  printf "\033[1;33mInstalling paru as AUR helper...\033[0m\n"
  sudo pacman -S --needed --noconfirm base-devel git
  cd /opt && sudo git clone https://aur.archlinux.org/paru.git && sudo chown -R "$(whoami)":"$(whoami)" ./paru
  cd paru && makepkg --noconfirm -si
  printf "\033[1;32mParu installed\033[0m\n"
else
  printf "\033[1;32mParu already installed\033[0m\n"
fi

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Only add chaotic-aur if not already present
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
fi

sudo pacman -Syu --noconfirm

paru -S --noconfirm --needed wget curl git unzip gum

source ~/.local/share/omakub/install/terminal/required/prerequisite.sh

# Symbolic dotfiles from omakub
source ~/.local/share/omakub/dotfiles/symlink.sh

source ~/.local/share/omakub/install/terminal/required/set-git.sh >/dev/null
source ~/.local/share/omakub/install/terminal/required/select-dev-language.sh

for installer in ~/.local/share/omakub/install/terminal/*.sh; do
  source "$installer"
done
