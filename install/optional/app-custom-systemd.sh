#!/usr/bin/env bash

# Define the path for systemd user units
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"

# Create the directory if it doesn't exist
mkdir -p "$SYSTEMD_USER_DIR"

echo "Creating systemd unit files in $SYSTEMD_USER_DIR..."

# 1. Create theme-switcher.service
cat >"$SYSTEMD_USER_DIR/theme-switcher.service" <<EOF
[Unit]
Description=Apply theme based on time of day

[Service]
Type=oneshot
ExecStart=%h/.local/share/omakub/bin/auto-theme-switcher
EOF

# 2. Create theme-switcher.timer
cat >"$SYSTEMD_USER_DIR/theme-switcher.timer" <<EOF
[Unit]
Description=Run theme switcher hourly

[Timer]
OnCalendar=hourly
Persistent=true

[Install]
WantedBy=timers.target
EOF

# 3. Create hyprsunset-manager.service
cat >"$SYSTEMD_USER_DIR/hyprsunset-manager.service" <<EOF
[Unit]
Description=Apply blue light filter based on time of day

[Service]
Type=oneshot
ExecStart=%h/.local/share/omakub/bin/hyprsunset-manager.sh
EOF

# 4. Create hyprsunset-manager.timer
cat >"$SYSTEMD_USER_DIR/hyprsunset-manager.timer" <<EOF
[Unit]
Description=Run Hyprland sunset manager every 1 minutes

[Timer]
OnBootSec=1min
OnUnitActiveSec=1min
AccuracySec=1min

[Install]
WantedBy=timers.target
EOF

echo "✅ Systemd unit files created successfully."
echo

# Reload systemd, and enable and start the timers
echo "🚀 Reloading systemd user daemon and enabling timers..."
systemctl --user daemon-reload
systemctl --user enable --now theme-switcher.timer
systemctl --user enable --now hyprsunset-manager.timer

echo
echo "All done! Timers are now active."
