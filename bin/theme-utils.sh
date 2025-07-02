#!/bin/bash

OMAKUB_PATH="${OMAKUB_PATH:-$HOME/.local/share/omakub}"

apply_theme() {
  local theme="$1"

  if [ -z "$theme" ]; then
    echo "❌ No theme specified to apply."
    return 1
  fi

  cp "$OMAKUB_PATH/themes/$theme/kitty.conf" ~/.config/kitty/theme.conf
  kill -SIGUSR1 "$(pidof kitty)"
  cp "$OMAKUB_PATH/themes/$theme/neovim.lua" ~/.config/nvim/lua/plugins/theme.lua
  cp "$OMAKUB_PATH/themes/$theme/rofi.rasi" ~/.config/rofi/shared/colors.rasi

  source "$OMAKUB_PATH/themes/$theme/vscode.sh"

  if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
    source "$OMAKUB_PATH/themes/$theme/gnome.sh"
  elif [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
    source "$OMAKUB_PATH/themes/$theme/hyprland.sh"

    cp "$OMAKUB_PATH/themes/$theme/mako.ini" ~/.config/mako/config
    pkill -f mako && mako &

    cp "$OMAKUB_PATH/themes/$theme/waybar.css" ~/.config/waybar/waybar.css
    pkill -f waybar && waybar &
  fi

  echo "$(date) - Theme switched to $theme" >>"$OMAKUB_PATH/auto-theme-switcher.log"
}
