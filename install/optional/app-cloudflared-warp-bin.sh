paru -S --noconfirm --needed cloudflare-warp-bin
sudo systemctl enable --now warp-svc.service
warp-cli connect
