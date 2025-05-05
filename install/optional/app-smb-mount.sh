#!/usr/bin/env bash

# Install required package
paru -S --noconfirm --needed cifs-utils || exit 1

home="$HOME"

# Read SMB credentials
read -rp "Enter Samba username: " smb_user
read -srp "Enter Samba password: " smb_pass
echo
echo -e "username=$smb_user\npassword=$smb_pass" >"$home/.smbcredentials"
chmod 600 "$home/.smbcredentials"

# Loop for multiple shares
while true; do
  read -rp "Enter the SMB server IP (or type 'stop' to exit): " smb_ip
  [[ "$smb_ip" == "stop" ]] && break

  read -rp "Enter the SMB share name: " smb_share
  read -rp "Enter the mount location: " mount_location

  # Create mount point directory if it doesn't exist
  sudo mkdir -p "$mount_location"

  # Append mount info to /etc/fstab
  sudo tee -a /etc/fstab >/dev/null <<EOF
//$smb_ip/$smb_share $mount_location cifs uid=1000,credentials=$home/.smbcredentials,noauto,x-systemd.automount,x-systemd.idle-timeout=30,x-systemd.mount-timeout=10 0 0
EOF
done

# Reload systemd mounts and mount all
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo mount -av
