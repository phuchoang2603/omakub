if ! command -v docker &>/dev/null; then
  paru -S --noconfirm docker docker-compose

  sudo systemctl enable --now docker.service
  # Give this user privileged Docker access
  sudo usermod -aG docker ${USER}
else
  echo "Docker is already installed."
fi

# LazyDocker
if ! command -v lazydocker &>/dev/null; then
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
else
  echo "LazyDocker is already installed."
fi
