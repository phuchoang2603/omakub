# 1. Install Rclone
echo "[+] Installing rclone..."
sudo -v
curl -s https://rclone.org/install.sh | sudo bash

# 2. Set 'user_allow_other' in /etc/fuse.conf
echo "[+] Configuring FUSE to allow 'allow_other'..."
if ! grep -q '^user_allow_other' /etc/fuse.conf; then
    echo 'user_allow_other' | sudo tee -a /etc/fuse.conf
else
    echo "  'user_allow_other' already set"
fi

# 4. Create mount directories
echo "[+] Creating mount points..."
mkdir -p ~/mnt/onedrive
mkdir -p ~/mnt/gdrive

# 5. Prepare service files
TEMPLATE_DIR="$HOME/.local/share/omakub/configs/rclone"
SYSTEMD_DIR="$HOME/.config/systemd/user"
mkdir -p "$SYSTEMD_DIR"

echo "[+] Installing systemd service files..."
for template in "$TEMPLATE_DIR"/*.service.template; do
    service_name=$(basename "$template" .template)
    sed "s|{{HOME}}|$HOME|g" "$template" > "$SYSTEMD_DIR/$service_name"
    echo "  -> Installed: $service_name"
done

# 6. Reload and enable all user services
echo "[+] Reloading and enabling systemd user services..."
systemctl --user daemon-reexec
systemctl --user daemon-reload

for service in "$SYSTEMD_DIR"/*.service; do
    systemctl --user enable --now "$(basename "$service")"
    echo "  -> Started: $(basename "$service")"
done

echo "[✓] Rclone setup complete!"