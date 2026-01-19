#!/bin/bash

source ~/.local/share/omakub/lib/installer.sh
source ~/.local/share/omakub/packages/terminal-packages.sh

echo "📦 Installing terminal packages..."

# Install all terminal packages via paru
for app_def in "${TERMINAL_PACKAGES[@]}"; do
  IFS=':' read -r cmd packages <<<"$app_def"
  install_if_missing "$cmd" $packages
done

# Post-install: Enable Docker service and add user to docker group
if command -v docker &>/dev/null; then
  sudo systemctl enable --now docker.service
  sudo usermod -aG docker ${USER}
fi

echo "✅ Terminal packages installed"
