# Mount samba storage
paru -S --noconfirm --needed cifs-utils

home="$HOME"

echo -n "Enter Samba username: "
read smb_user
echo -n "Enter Samba password: "
read -s smb_pass
echo -e "username=$smb_user\npassword=$smb_pass" >"$home/.smbcredentials"
chmod 600 "$home/.smbcredentials"

sudo mkdir -p /mnt/DATA /mnt/repos

sudo tee -a /etc/fstab >/dev/null <<EOF
//192.168.69.121/DATA /mnt/DATA cifs uid=1000,credentials=$home/.smbcredentials,noauto,x-systemd.automount,x-systemd.idle-timeout=30,x-systemd.mount-timeout=10 0 0
//192.168.69.121/repos /mnt/repos cifs uid=1000,credentials=$home/.smbcredentials,noauto,x-systemd.automount,x-systemd.idle-timeout=30,x-systemd.mount-timeout=10 0 0
EOF

sudo systemctl daemon-reload

sudo mount -av
