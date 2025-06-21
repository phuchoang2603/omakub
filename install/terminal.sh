# Update packages and install package manager
if [ "$OMAKUB_OS_ID" == "arch" ]; then
  sudo pacman -Syu --noconfirm

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

  paru -S --noconfirm --needed curl git unzip gum

elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt update -y && sudo apt upgrade -y
  sudo apt install -y curl git unzip

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
