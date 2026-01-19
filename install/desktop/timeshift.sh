paru -S --noconfirm --needed timeshift grub-btrfs inotify-tools

SERVICE_NAME="grub-btrfsd.service"
OVERRIDE_DIR="/etc/systemd/system/$SERVICE_NAME.d"
OVERRIDE_FILE="$OVERRIDE_DIR/10-timeshift-override.conf"

CONFIG_CONTENT="[Service]
ExecStart=
ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto"

sudo mkdir -p "$OVERRIDE_DIR"

sudo tee "$OVERRIDE_FILE" >/dev/null <<EOF
$CONFIG_CONTENT
EOF

sudo systemctl daemon-reload
sudo systemctl restart $SERVICE_NAME
