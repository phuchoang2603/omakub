# 1. Install Rclone
echo "[+] Installing rclone..."
sudo -v
curl -s https://rclone.org/install.sh | sudo bash

# --- Prompt for rclone configuration ---
echo "You will be prompted to create new remotes (e.g., for OneDrive, Google Drive)."
echo "Press Enter to continue to rclone config..."
read -r
rclone config

# 2. Set 'user_allow_other' in /etc/fuse.conf
echo "[+] Configuring FUSE to allow 'allow_other'..."
if ! grep -q '^user_allow_other' /etc/fuse.conf; then
    echo 'user_allow_other' | sudo tee -a /etc/fuse.conf
else
    echo "  'user_allow_other' already set"
fi

# 4. Create mount directories
echo "[+] Creating mount points..."
mkdir -p ~/mnt/onedrive
mkdir -p ~/mnt/gdrive

# 5. Prepare service files
TEMPLATE_DIR="$HOME/.config/rclone"
SYSTEMD_DIR="$HOME/.config/systemd/user"
mkdir -p "$SYSTEMD_DIR"

echo "[+] Installing systemd service files..."
for template in "$TEMPLATE_DIR"/*.service.template; do
    service_name=$(basename "$template" .template)
    sed "s|{{HOME}}|$HOME|g" "$template" >"$SYSTEMD_DIR/$service_name"
    echo "  -> Installed: $service_name"
done

# 6. Reload and enable all user services
echo "[+] Reloading and enabling systemd user services..."
systemctl --user daemon-reexec
systemctl --user daemon-reload

for service in "$SYSTEMD_DIR"/*.service; do
    systemctl --user enable --now "$(basename "$service")"
    echo "  -> Started: $(basename "$service")"
done

# 7. Symlink the rclone directory to the home directory
declare -a directories=("Pictures" "Documents" "Music" "Videos" "Downloads")
RCLONE_MOUNT_BASE="$HOME/mnt/onedrive/Library/" # Base path where your rclone remote

for dir in "${directories[@]}"; do
    SOURCE_PATH="$RCLONE_MOUNT_BASE/$dir"
    TARGET_PATH="$HOME/$dir"

    echo "Processing directory: $dir"

    if [ ! -d "$SOURCE_PATH" ]; then
        echo "  Warning: Source path '$SOURCE_PATH' does not exist."
    fi

    # Remove existing regular file or empty directory if it conflicts
    if [ -f "$TARGET_PATH" ] || ([ -d "$TARGET_PATH" ] && ! [ -L "$TARGET_PATH" ] && [ -z "$(ls -A "$TARGET_PATH")" ]); then
        echo "  Removing existing empty directory or file at $TARGET_PATH to create symlink."
        rm -rf "$TARGET_PATH"
    elif [ -L "$TARGET_PATH" ]; then
        echo "  Existing symlink found at $TARGET_PATH. Updating..."
        rm "$TARGET_PATH" # Remove existing symlink before creating a new one
    elif [ -d "$TARGET_PATH" ] && [ "$(ls -A "$TARGET_PATH")" ]; then
        echo "  Warning: Directory '$TARGET_PATH' already exists and is not empty or a symlink. Skipping symlink creation for $dir to avoid data loss."
        echo "  Please manually move contents or remove this directory if you wish to symlink."
        continue # Skip to the next directory
    fi

    # Create the symlink
    if ln -sf "$SOURCE_PATH" "$TARGET_PATH"; then
        echo "  Symbolic link created successfully:"
        echo "    From: $SOURCE_PATH"
        echo "    To:   $TARGET_PATH"
        ls -ld "$TARGET_PATH" # Use -ld to show symlink details, not contents
    else
        echo "  Error: Failed to create symbolic link for $dir."
    fi
done

echo "[✓] Rclone setup complete!"
