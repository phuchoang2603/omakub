#!/usr/bin/env bash

# Define the path for systemd user units
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"

# Create the directory if it doesn't exist
mkdir -p "$SYSTEMD_USER_DIR"

# 1. Create theme-switcher.service
cat >"$SYSTEMD_USER_DIR/theme-switcher.service" <<EOF
[Unit]
Description=Apply theme based on time of day

[Service]
Type=oneshot
ExecStart=%h/.local/share/omakub/bin/auto-theme-switcher
EOF

cat >"$SYSTEMD_USER_DIR/theme-switcher.timer" <<EOF
[Unit]
Description=Run theme switcher hourly

[Timer]
OnCalendar=hourly
Persistent=true

[Install]
WantedBy=timers.target
EOF

# 2. Create hyprsunset-manager.service
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

[Install]
WantedBy=timers.target
EOF

# Reload systemd, and enable and start the timers
systemctl --user daemon-reload
systemctl --user enable --now theme-switcher.timer
systemctl --user enable --now hyprsunset-manager.timer
