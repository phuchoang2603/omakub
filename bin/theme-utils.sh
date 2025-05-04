#!/bin/bash

OMAKUB_PATH="${OMAKUB_PATH:-$HOME/.local/share/omakub}"

apply_theme() {
  local theme="$1"

  if [ -z "$theme" ]; then
    echo "❌ No theme specified to apply."
    return 1
  fi

  cp "$OMAKUB_PATH/themes/$theme/kitty.conf" ~/.config/kitty/theme.conf
  cp "$OMAKUB_PATH/themes/$theme/neovim.lua" ~/.config/nvim/lua/plugins/theme.lua
  cp "$OMAKUB_PATH/themes/$theme/rofi.rasi" ~/.config/rofi/shared/colors.rasi

  source "$OMAKUB_PATH/themes/$theme/vscode.sh"

  if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || [ -n "$DISPLAY" ]; then
    source "$OMAKUB_PATH/themes/$theme/gnome.sh"
    source "$OMAKUB_PATH/themes/$theme/tophat.sh"
  fi

  echo "$(date) - Theme switched to $theme" >>"$OMAKUB_PATH/auto-theme-switcher.log"
}
