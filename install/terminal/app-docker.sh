paru -S --noconfirm \
  docker lazydocker \
  docker-compose

sudo systemctl start docker.service

# Give this user privileged Docker access
sudo usermod -aG docker ${USER}
