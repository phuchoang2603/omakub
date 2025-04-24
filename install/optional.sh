#!/bin/bash

RESOLVED_CONF="/etc/systemd/resolved.conf"

echo "Updating DNS settings in $RESOLVED_CONF..."

# Backup existing config
sudo cp "$RESOLVED_CONF" "$RESOLVED_CONF.bak"

# Write the new configuration
sudo tee "$RESOLVED_CONF" > /dev/null <<EOF
[Resolve]
DNS=45.90.28.0#a224db.dns.nextdns.io
DNS=2a07:a8c0::#a224db.dns.nextdns.io
DNS=45.90.30.0#a224db.dns.nextdns.io
DNS=2a07:a8c1::#a224db.dns.nextdns.io
DNSOverTLS=yes
EOF

# Apply changes
echo "Reloading and restarting systemd-resolved..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable systemd-resolved
sudo systemctl restart systemd-resolved

echo "DNS configuration updated and service restarted."