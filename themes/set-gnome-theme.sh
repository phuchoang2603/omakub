# Set GNOME UI theme preferences
gsettings set org.gnome.desktop.interface gtk-theme "Graphite-Dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Update papirus icon cache in background to avoid blocking the terminal
CACHE_UPDATE_SCRIPT="/tmp/update-cache.sh"
LOG_FILE="/tmp/update-cache.log"
cat >"$CACHE_UPDATE_SCRIPT" <<EOF
#!/bin/bash
set -e
papirus-folders -C "$OMAKUB_THEME_COLOR" --theme Papirus-Dark
EOF
chmod +x "$CACHE_UPDATE_SCRIPT"
nohup "$CACHE_UPDATE_SCRIPT" &>"$LOG_FILE" &

# Wallpaper setup
BACKGROUND_ORG_PATH="$HOME/.local/share/omakub/themes/$OMAKUB_THEME_BACKGROUND"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/current.png"

# Ensure background directory exists
mkdir -p "$BACKGROUND_DEST_DIR"

# Copy theme-specific wallpaper to 'current.png'
cp "$BACKGROUND_ORG_PATH" "$BACKGROUND_DEST_PATH"

# Set the wallpaper
gsettings set org.gnome.desktop.background picture-uri "file://$BACKGROUND_DEST_PATH"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$BACKGROUND_DEST_PATH"
gsettings set org.gnome.desktop.background picture-options 'zoom'
