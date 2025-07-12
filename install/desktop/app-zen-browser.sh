bash <(curl -s https://updates.zen-browser.app/install.sh)

# Preload is a daemon that preloads applications into memory to speed up their launch time
paru -S --noconfirm --needed preload
sudo systemctl enable --now preload.service

# Profile-sync-daemon is a tool that allows browsers to use RAM for their profile storage, improving performance
paru -S --noconfirm --needed profile-sync-daemon profile-sync-daemon-zen

USERNAME="$USER"
SUDOERS_FILE="/etc/sudoers.d/99-psd-helper-$USERNAME"

echo "$USERNAME ALL=(ALL) NOPASSWD: /usr/bin/psd-overlay-helper" | sudo tee "$SUDOERS_FILE" >/dev/null
sudo chmod 440 "$SUDOERS_FILE"

systemctl --user enable --now psd.service
