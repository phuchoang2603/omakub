# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  for installer in ~/.local/share/omakub/install/desktop/*.sh; do source $installer; done
  for installer in ~/.local/share/omakub/install/desktop/gnome/*.sh; do source $installer; done
fi

source ~/.local/share/omakub/bin/change-theme
source ~/.local/share/omakub/bin/change-font

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
