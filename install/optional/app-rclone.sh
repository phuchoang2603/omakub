#!/bin/bash
# 1. Install Rclone (Keep as is, crucial)
echo "[+] Installing rclone..."
sudo -v # Prompt for sudo password upfront
curl -s https://rclone.org/install.sh | sudo bash

# --- Prompt for rclone configuration (Keep as is) ---
echo "You will be prompted to create new remotes (e.g., for OneDrive)."
echo "Press Enter to continue to rclone config..."
read -r
rclone config

# Define paths
# These variables will be substituted into the template files
ONEDRIVE_REMOTE_NAME="onedrive"
ONEDRIVE_LIBRARY_BASE="Library"

# Define local directories to bisync with their respective OneDrive counterparts
declare -a SYNC_DIRS=("Pictures" "Documents" "Music" "Videos" "Downloads")

# Define template and systemd directories
TEMPLATE_DIR="$HOME/.config/rclone"
SYSTEMD_DIR="$HOME/.config/systemd/user"

mkdir -p "$SYSTEMD_DIR" # Ensure only the systemd target directory exists

echo "[+] Ensuring local target directories exist and preparing for --check-access..."
for dir in "${SYNC_DIRS[@]}"; do
    mkdir -p "$HOME/$dir" # Ensure local directory exists

    echo "  -> Creating RCLONE_TEST in $HOME/$dir..."
    rclone touch "$HOME/$dir/RCLONE_TEST"
    if [ $? -ne 0 ]; then
        echo "  Error: Failed to create local RCLONE_TEST in $HOME/$dir. Check permissions."
        exit 1
    fi

    echo "  -> Creating RCLONE_TEST in $ONEDRIVE_REMOTE_NAME:$ONEDRIVE_LIBRARY_BASE/$dir..."
    rclone touch "$ONEDRIVE_REMOTE_NAME:$ONEDRIVE_LIBRARY_BASE/$dir/RCLONE_TEST"
    if [ $? -ne 0 ]; then
        echo "  Error: Failed to create remote RCLONE_TEST in $ONEDRIVE_REMOTE_NAME:$ONEDRIVE_LIBRARY_BASE/$dir. Check remote config/permissions."
        exit 1
    fi
done

# 2. Process and install specific service files from templates
echo "[+] Installing specific systemd service and timer files from '$TEMPLATE_DIR'..."

# Define the exact template filenames you want to use
SERVICE_TEMPLATE_NAME="rclone-bisync.service.template"
TIMER_TEMPLATE_NAME="rclone-bisync.timer.template"

# Install the service template with variable substitution
SERVICE_TEMPLATE_PATH="$TEMPLATE_DIR/$SERVICE_TEMPLATE_NAME"
if [ -f "$SERVICE_TEMPLATE_PATH" ]; then
    # Use sed to replace the placeholders with actual values
    sed -e "s|{{ONEDRIVE_REMOTE_NAME}}|$ONEDRIVE_REMOTE_NAME|g" \
        -e "s|{{ONEDRIVE_LIBRARY_BASE}}|$ONEDRIVE_LIBRARY_BASE|g" \
        "$SERVICE_TEMPLATE_PATH" >"$SYSTEMD_DIR/rclone-bisync@.service"
    echo "  -> Installed: rclone-bisync@.service (variables substituted)"
else
    echo "  Error: Service template '$SERVICE_TEMPLATE_PATH' not found. Aborting."
fi

# Install the timer template (no substitution needed here)
TIMER_TEMPLATE_PATH="$TEMPLATE_DIR/$TIMER_TEMPLATE_NAME"
if [ -f "$TIMER_TEMPLATE_PATH" ]; then
    cp "$TIMER_TEMPLATE_PATH" "$SYSTEMD_DIR/rclone-bisync@.timer"
    echo "  -> Installed: rclone-bisync@.timer"
else
    echo "  Error: Timer template '$TIMER_TEMPLATE_PATH' not found. Aborting."
fi

# 3. Reload Systemd user services
echo "[+] Reloading systemd user services..."
systemctl --user daemon-reexec
systemctl --user daemon-reload

# 4. Perform the initial --resync for each folder in SYNC_DIRS (LIVE RUN)
echo ""
echo "--------------------------------------------------------------------------------"
echo "[+] Performing initial --resync for each synchronized directory (LIVE RUN)..."
echo "    This will directly modify files on both sides as per bisync rules."
echo "--------------------------------------------------------------------------------"

for dir in "${SYNC_DIRS[@]}"; do
    echo ""
    echo ">>> Running actual initial bisync for: $dir <<<"
    echo "    (Syncing $ONEDRIVE_REMOTE_NAME:$ONEDRIVE_LIBRARY_BASE/$dir with $HOME/$dir)"
    echo ""

    /usr/bin/rclone bisync \
        "$ONEDRIVE_REMOTE_NAME:$ONEDRIVE_LIBRARY_BASE/$dir" \
        "$HOME/$dir" \
        --create-empty-src-dirs \
        --compare size,modtime,checksum \
        --slow-hash-sync-only \
        --resilient \
        --recover \
        --fix-case \
        --conflict-resolve newer \
        --conflict-loser delete \
        -MvP \
        --check-access \
        --resync # NO --dry-run

    if [ $? -ne 0 ]; then
        echo ""
        echo "!!! Initial bisync for $dir failed. Please review the errors above. !!!"
        echo "!!! Some folders might not be fully synced.                         !!!"
        echo "--------------------------------------------------------------------"
        # Continue to other directories but notify user of failure
    fi
    echo ""
    echo ">>> Initial sync for $dir completed. <<<"
done

# 5. Enable and start Systemd services/timers for all SYNC_DIRS
echo ""
echo "--------------------------------------------------------------------------------"
echo "[+] Enabling and starting Systemd services and timers for all synced directories..."
echo "    These will now run on demand or automatically every 4 hours."
echo "--------------------------------------------------------------------------------"

for dir in "${SYNC_DIRS[@]}"; do
    echo "  -> Enabling and starting rclone-bisync@$dir.service..."
    systemctl --user enable --now "rclone-bisync@$dir.service"

    echo "  -> Enabling and starting rclone-bisync@$dir.timer (for 4-hourly syncs)..."
    systemctl --user enable --now "rclone-bisync@$dir.timer"
done

echo "[✓] Rclone setup complete!"
echo "To check the status of any bisync run (e.g., for 'Pictures'):"
echo "  systemctl --user status rclone-bisync@Pictures.service"
