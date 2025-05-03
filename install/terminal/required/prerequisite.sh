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
  curl git unzip bash bash-completion autoconf bison base-devel clang pkgconf meson libinput \
  ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick bat btop eza tldr cronie \
  python-pipx python-pip
