#!/bin/bash
# paru -Rdd $(pacman -Qsq "hypr|aqua")

packages=(
  waybar
  mako
  uwsm
)

paru -S --needed --noconfirm "${packages[@]}"

systemctl --user enable --now hypridle.service
systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hyprsunset.service
systemctl --user enable --now mako.service
systemctl --user enable --now waybar.service

# Create hyprsunset-manager.service
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"
mkdir -p "$SYSTEMD_USER_DIR"

cat >"$SYSTEMD_USER_DIR/hyprsunset-manager.service" <<EOF
[Unit]
Description=Apply blue light filter based on time of day
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=oneshot
ExecStart=%h/.local/share/omakub/bin/hyprsunset-manager.sh
EOF

cat >"$SYSTEMD_USER_DIR/hyprsunset-manager.timer" <<EOF
[Unit]
Description=Run Hyprland sunset manager every 1 minutes

[Timer]
OnBootSec=15s
OnUnitActiveSec=15min
AccuracySec=1s
Persistent=true

[Install]
WantedBy=timers.target
EOF

systemctl --user daemon-reload
systemctl --user enable --now hyprsunset-manager.timer
