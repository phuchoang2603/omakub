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
