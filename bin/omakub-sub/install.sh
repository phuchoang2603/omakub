CHOICES=(
  "> Optionals       Install optional applications"
  "> Laptop          Install tools for laptop"
  "> All             Re-run any of the default installers"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 20 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  INSTALLER_FILE=$(gum file $OMAKUB_PATH/install)

  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
elif [[ "$CHOICE" == "> Laptop"* ]]; then
  INSTALLER_FILE=$(gum file $OMAKUB_PATH/install/terminal/laptop)
  
  [[ -f "$INSTALLER_FILE" ]] &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  INSTALLER_FILE=$(gum file $OMAKUB_PATH/install/desktop/optional)
  
  [[ -f "$INSTALLER_FILE" ]] &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub