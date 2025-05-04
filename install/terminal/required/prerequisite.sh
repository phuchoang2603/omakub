# Needed for all installer
sudo pacman -Syu --noconfirm

if ! command -v paru &>/dev/null; then
  printf "\033[1;33mInstalling paru as AUR helper...\033[0m\n"
  sudo pacman -S --needed --noconfirm base-devel git
  cd /opt && sudo git clone https://aur.archlinux.org/paru-bin.git && sudo chown -R "$(whoami)":"$(whoami)" ./paru-bin
  cd paru-bin && makepkg --noconfirm -si
  printf "\033[1;32mParu installed\033[0m\n"
else
  printf "\033[1;32mParu already installed\033[0m\n"
fi

paru -S --noconfirm --needed \
  base-devel autoconf bison clang pkgconf meson \
  bash bash-completion curl git unzip tldr cronie man-db man-pages \
  ffmpeg jq poppler fd ripgrep fzf zoxide imagemagick bat btop eza \
  python-pipx python-pip libinput
