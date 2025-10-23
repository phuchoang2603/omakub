#!/bin/bash

set -e

echo "=> Enabling the multilib repository..."
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

echo "=> Synchronizing package databases..."
paru -Syy

echo "=> Installing Steam..."
paru -S --noconfirm --needed steam glxinfo
