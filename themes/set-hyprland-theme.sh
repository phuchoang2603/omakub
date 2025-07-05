# Wallpaper setup
BACKGROUND_ORG_PATH="$HOME/.local/share/omakub/themes/$OMAKUB_THEME_BACKGROUND"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/current.png"

# Ensure background directory exists
mkdir -p "$BACKGROUND_DEST_DIR"

# Copy theme-specific wallpaper to 'current.png'
cp "$BACKGROUND_ORG_PATH" "$BACKGROUND_DEST_PATH"
systemctl --user restart hyprpaper.service

# Color setup
HYPR_COLORS_CONF="$HOME/.config/hypr/colors.conf"
sed -i "s|^\$primary.*|\$primary = ${OMAKUB_PRIMARY_COLOR}|" "$HYPR_COLORS_CONF"
sed -i "s|^\$text.*|\$text = ${OMAKUB_TEXT_COLOR}|" "$HYPR_COLORS_CONF"
