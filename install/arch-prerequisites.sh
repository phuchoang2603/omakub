#!/bin/bash

echo "🔧 Setting up Arch Linux prerequisites..."

# Install paru (AUR helper)
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

# Setup chaotic-aur repository
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
fi

sudo pacman -Syu --noconfirm

# Install essential tools (wget, curl, git, gum)
paru -S --noconfirm --needed wget curl git unzip gum

echo "✅ Prerequisites installed"
