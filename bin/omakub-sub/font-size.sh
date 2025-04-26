choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
  sed -i "s/^font_size .*/font_size $choice/g" ~/.config/kitty/font-size.conf
  source $OMAKUB_PATH/bin/omakub-sub/font-size.sh
else
  source $OMAKUB_PATH/bin/omakub-sub/font.sh
fi
