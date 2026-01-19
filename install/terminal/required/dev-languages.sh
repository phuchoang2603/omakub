#!/bin/bash

# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
if ! command -v mise &>/dev/null; then
  curl https://mise.run | sh
fi
source ~/.bashrc

mise use --global node@lts || INSTALL_ERRORS+=("Failed to install Node.js via mise")
mise use --global go@latest || INSTALL_ERRORS+=("Failed to install Go via mise")
mise use --global python@latest || INSTALL_ERRORS+=("Failed to install Python via mise")
mise use --global uv@latest || INSTALL_ERRORS+=("Failed to install uv via mise")
bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y || INSTALL_ERRORS+=("Failed to install Rust via rustup")

source ~/.bashrc
