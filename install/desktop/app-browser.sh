paru -S --noconfirm --needed microsoft-edge-stable-bin

# Preload is a daemon that preloads applications into memory to speed up their launch time
paru -S --noconfirm --needed preload
sudo systemctl enable --now preload.service
