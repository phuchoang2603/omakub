#!/bin/bash

set -e

echo "=> Enabling the multilib repository..."
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

echo "=> Synchronizing package databases..."
paru -Syy

echo "=> Installing Steam..."
paru -S --noconfirm --needed steam glxinfo

# Install SteamGridDB
wget https://github.com/SteamGridDB/SGDBoop/releases/latest/download/sgdboop-linux64.tar.gz
mkdir sgdboop-linux64
tar -zxf sgdboop-linux64.tar.gz -C sgdboop-linux64
chmod +x sgdboop-linux64/install.sh
sudo ./sgdboop-linux64/install.sh
