OMAKUB_THEME_BACKGROUND="pywal/current.png"

wal -i "$OMAKUB_PATH/themes/$OMAKUB_THEME_BACKGROUND" -s -t

original_filename=$(basename "$(readlink "$OMAKUB_PATH/themes/$OMAKUB_THEME_BACKGROUND")")
OMAKUB_THEME_COLOR="${original_filename%%-*}"

source ~/.cache/wal/colors.sh

TEXT_HEX="$color0"
PRIMARY_HEX="$color1"

cp ~/.cache/wal/colors-kitty.conf "$OMAKUB_PATH/themes/pywal/kitty.conf"
cp ~/.cache/wal/colors-waybar.css "$OMAKUB_PATH/themes/pywal/waybar.css"
cp ~/.cache/wal/colors-rofi-temp.rasi "$OMAKUB_PATH/themes/pywal/rofi.rasi"
cp ~/.cache/wal/colors-mako-temp "$OMAKUB_PATH/themes/pywal/mako.ini"
cp ~/.cache/wal/colors-spicetify-sleek.ini ~/.config/spicetify/Themes/Sleek/color.ini
jq --arg newColor "$PRIMARY_HEX" '.accentColor = $newColor' ~/repos/personal/obsidian/.obsidian/appearance.json >tmp.json && mv tmp.json ~/repos/personal/obsidian/.obsidian/appearance.json
~/.spicetify/spicetify apply

source $OMAKUB_PATH/themes/set-hyprland-theme.sh
