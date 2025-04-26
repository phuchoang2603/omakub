THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Gruvbox")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  cp $OMAKUB_PATH/themes/$THEME/kitty.conf ~/.config/kitty/theme.conf
  cp $OMAKUB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  source $OMAKUB_PATH/themes/$THEME/gnome.sh
  source $OMAKUB_PATH/themes/$THEME/tmux.sh
  source $OMAKUB_PATH/themes/$THEME/tophat.sh
  source $OMAKUB_PATH/themes/$THEME/vscode.sh
fi

source $OMAKUB_PATH/bin/omakub-sub/menu.sh
