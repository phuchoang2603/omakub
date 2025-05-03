# Set GNOME UI theme preferences
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-${OMAKUB_THEME_COLOR}-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-${OMAKUB_THEME_COLOR}"
gsettings set org.gnome.desktop.interface accent-color "${OMAKUB_THEME_COLOR}" 2>/dev/null || true

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
