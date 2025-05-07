for installer in ~/.local/share/omakub/install/desktop/*.sh; do source $installer; done

if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  for installer in ~/.local/share/omakub/install/desktop/gnome/*.sh; do source $installer; done
fi

if gum confirm "Do you want to install Hyprland packages?"; then
  for installer in ~/.local/share/omakub/install/desktop/hyprland/*.sh; do source "$installer"; done
fi

source ~/.local/share/omakub/bin/change-theme

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
