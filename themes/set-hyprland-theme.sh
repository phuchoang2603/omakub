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
BACKGROUND_ORG_PATH="$OMAKUB_PATH/themes/$OMAKUB_THEME_BACKGROUND"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/current.png"

mkdir -p "$BACKGROUND_DEST_DIR"

cp "$BACKGROUND_ORG_PATH" "$BACKGROUND_DEST_PATH"
systemctl --user restart hyprpaper.service

# Color setup
OMAKUB_TEXT_COLOR="rgba(${TEXT_HEX#\#}FF)"
OMAKUB_PRIMARY_COLOR="rgba(${PRIMARY_HEX#\#}FF)"

HYPR_COLORS_CONF="$HOME/.config/hypr/colors.conf"
sed -i "s|^\$primary.*|\$primary = ${OMAKUB_PRIMARY_COLOR}|" "$HYPR_COLORS_CONF"
sed -i "s|^\$text.*|\$text = ${OMAKUB_TEXT_COLOR}|" "$HYPR_COLORS_CONF"
