source ~/.local/share/omakub/check-os.sh

read -p "Enter github username: " OMAKUB_USER_NAME
export OMAKUB_USER_NAME

read -p "Enter email address: " OMAKUB_USER_EMAIL
export OMAKUB_USER_EMAIL

# Update packages and install package manager
if [ "$OMAKUB_OS_ID" == "arch" ]; then
  # Install paru if not already installed
  if ! command -v paru &>/dev/null; then
    printf "\033[1;33mInstalling paru as AUR helper...\033[0m\n"
    sudo pacman -S --needed --noconfirm base-devel git
    cd /opt && sudo git clone https://aur.archlinux.org/paru-bin.git && sudo chown -R "$(whoami)":"$(whoami)" ./paru-bin
    cd paru-bin && makepkg --noconfirm -si
    printf "\033[1;32mParu installed\033[0m\n"
  else
    printf "\033[1;32mParu already installed\033[0m\n"
  fi

  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB

  sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

  sudo pacman -Syu --noconfirm

  paru -S --noconfirm --needed wget curl git unzip gum

elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt update -y && sudo apt upgrade -y
  sudo apt install -y wget curl git unzip

  # Install gum from Charm repo
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
  echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
  sudo apt update && sudo apt install -y gum

fi

source ~/.local/share/omakub/install/terminal/required/prerequisite.sh

# Symbolic dotfiles
if [ ! -d "$HOME/repos/dotfiles" ]; then
  git clone https://github.com/phuchoang2603/dotfiles.git ~/repos/dotfiles
fi
source ~/repos/dotfiles/symlink.sh

source ~/.local/share/omakub/install/terminal/required/set-git.sh >/dev/null
source ~/.local/share/omakub/install/terminal/required/select-dev-language.sh

for installer in ~/.local/share/omakub/install/terminal/*.sh; do
  source "$installer"
done
