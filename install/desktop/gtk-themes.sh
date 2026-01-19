#!/bin/bash

# ========================================
# GTK Theme (Graphite + Papirus Icons)
# ========================================
echo "→ Installing GTK Theme..."

# Theming + App Support packages
gtk_packages=(
  libadwaita
  kvantum-qt5
  qt5-wayland
  qt6-wayland
  qt5ct
  qt6ct
  gnome-themes-extra
  gtk-engine-murrine
  sassc
)

paru -S --noconfirm --needed "${gtk_packages[@]}" || {
  INSTALL_ERRORS+=("Failed to install GTK theme packages")
}

# Install Graphite theme and Papirus icons
if [ ! -d ~/repos/Graphite-gtk-theme ]; then
  wget -qO- https://git.io/papirus-icon-theme-install | sh
  wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh
  git clone https://github.com/vinceliuice/Graphite-gtk-theme.git --depth 1 ~/repos/Graphite-gtk-theme || {
    INSTALL_ERRORS+=("Failed to clone Graphite theme")
  }
else
  echo "✓ Graphite theme and Papirus already installed"
fi

~/repos/Graphite-gtk-theme/install.sh -d $HOME/.themes -t -c dark -s standard -l --tweaks black rimless normal || {
  INSTALL_ERRORS+=("Failed to install Graphite theme")
}

# ========================================
# GRUB Theme
# ========================================
echo "→ Installing GRUB Theme..."

if [ ! -d ~/repos/Graphite-gtk-theme ]; then
  git clone https://github.com/vinceliuice/Graphite-gtk-theme.git --depth 1 ~/repos/Graphite-gtk-theme || {
    INSTALL_ERRORS+=("Failed to clone Graphite theme for GRUB")
  }
fi

sudo ~/repos/Graphite-gtk-theme/other/grub2/install.sh -b || {
  INSTALL_ERRORS+=("Failed to install GRUB theme")
}

echo "✅ Themes installed"
