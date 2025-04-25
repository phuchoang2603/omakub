# Mount samba storage
sudo apt-get install -y cifs-utils

home="$HOME"

sudo mkdir -p /mnt/DATA /mnt/repos

sudo tee -a /etc/fstab >/dev/null <<EOF
//192.168.69.121/DATA /mnt/DATA cifs uid=1000,credentials=$home/.smbcredentials 0 0
//192.168.69.121/repos /mnt/repos cifs uid=1000,credentials=$home/.smbcredentials 0 0
EOF

sudo systemctl daemon-reload

sudo mount -a
