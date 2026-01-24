#!/bin/bash

echo "🔧 Setting up prerequisites..."

# ========================================
# Install Homebrew (for CLI applications)
# ========================================
if ! command -v brew &>/dev/null; then
  echo "→ Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add brew to current shell session
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  echo "✅ Homebrew installed"
else
  echo "✅ Homebrew already installed"
fi

# ========================================
# Install paru (for system packages & desktop apps)
# ========================================
if ! command -v paru &>/dev/null; then
  echo "→ Installing paru..."
  sudo pacman -S --needed --noconfirm base-devel git
  cd /opt && sudo git clone https://aur.archlinux.org/paru.git
  sudo chown -R "$(whoami)":"$(whoami)" ./paru
  cd paru && makepkg --noconfirm -si
  echo "✅ Paru installed"
else
  echo "✅ Paru already installed"
fi

# ========================================
# Setup chaotic-aur repository
# ========================================
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
fi

sudo pacman -Syu --noconfirm

# ========================================
# Install system packages via paru
# (NOT CLI tools - those use Homebrew)
# ========================================
paru -S --noconfirm --needed \
  base-devel autoconf bison clang pkgconf meson \
  bash-completion zsh-completions cronie man-db man-pages \
  python-pipx python-pip

echo "✅ Prerequisites installed"
