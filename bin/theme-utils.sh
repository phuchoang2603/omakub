#!/bin/bash

OMAKUB_PATH="${OMAKUB_PATH:-$HOME/.local/share/omakub}"

apply_theme() {
  local theme="$1"

  if [ -z "$theme" ]; then
    echo "❌ No theme specified to apply."
    return 1
  fi

  source "$OMAKUB_PATH/themes/$theme/hyprland.sh"

  cp "$OMAKUB_PATH/themes/$theme/mako.ini" ~/.config/mako/colors
  systemctl --user restart mako.service

  cp "$OMAKUB_PATH/themes/$theme/waybar.css" ~/.config/waybar/waybar.css
  systemctl --user restart waybar.service

  cp "$OMAKUB_PATH/themes/$theme/ghostty" ~/.config/ghostty/theme
  pkill -SIGUSR1 ghostty 2>/dev/null || true

  cp "$OMAKUB_PATH/themes/$theme/neovim.lua" ~/.config/nvim/lua/plugins/theme.lua
  cp "$OMAKUB_PATH/themes/$theme/rofi.rasi" ~/.config/rofi/colors.rasi

  cp "$OMAKUB_PATH/themes/$theme/spicetify-sleek.ini" ~/.config/spicetify/Themes/Sleek/color.ini
  ~/.spicetify/spicetify apply

  notify-send "Theme Switcher" "The theme has been changed to $theme"
}
