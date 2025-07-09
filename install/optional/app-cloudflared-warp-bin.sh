if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed cloudflare-warp-bin
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install cloudflare-warp
fi

sudo systemctl enable --now warp-svc.service
warp-cli connect
