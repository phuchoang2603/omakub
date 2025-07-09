#!/usr/bin/env bash

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
# Reload systemd, and enable and start the timers
systemctl --user enable --now theme-switcher.timer
