OMAKUB_THEME_BACKGROUND="pywal/pywal.png"
COLORS_FILE="$HOME/.cache/wal/colors"
THEME_DIR="$OMAKUB_PATH/themes/pywal"

wal -i "$OMAKUB_PATH/themes/$OMAKUB_THEME_BACKGROUND" -s -t

mapfile -t colors <"$COLORS_FILE"

TEXT_HEX="${colors[0]}"
PRIMARY_HEX="${colors[1]}"

OMAKUB_TEXT_COLOR="rgba(${TEXT_HEX#\#}FF)"
OMAKUB_PRIMARY_COLOR="rgba(${PRIMARY_HEX#\#}FF)"

cp ~/.cache/wal/colors-kitty.conf "$OMAKUB_PATH/themes/pywal/kitty.conf"
cp ~/.cache/wal/colors-waybar.css "$OMAKUB_PATH/themes/pywal/waybar.css"

cat <<EOF >"$THEME_DIR/mako.ini"
text-color=${colors[7]}
border-color=${colors[1]}
background-color=${colors[0]}
progress-color=${colors[2]}
EOF

cat <<EOF >"$THEME_DIR/rofi.rasi"
* {
    background:     ${colors[0]};
    background-alt: ${colors[0]};
    foreground:     ${colors[7]};
    selected:       ${colors[2]};
    active:         ${colors[1]};
    urgent:         ${colors[3]};
}
EOF

source $OMAKUB_PATH/themes/set-hyprland-theme.sh
