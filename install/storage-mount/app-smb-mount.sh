# Mount samba storage
paru -S --noconfirm --needed cifs-utils

home="$HOME"

read -pr "Enter Samba username: " smb_user
read -spr "Enter Samba password: " smb_pass
echo
echo -e "username=$smb_user\npassword=$smb_pass" >"$home/.smbcredentials"
chmod 600 "$home/.smbcredentials"

sudo mkdir -p /mnt/DATA /mnt/repos

sudo tee -a /etc/fstab >/dev/null <<EOF
//192.168.69.121/DATA /mnt/DATA cifs uid=1000,credentials=$home/.smbcredentials 0 0
//192.168.69.121/repos /mnt/repos cifs uid=1000,credentials=$home/.smbcredentials 0 0
EOF

sudo systemctl daemon-reload

sudo mount -av
