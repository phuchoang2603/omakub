for installer in ~/.local/share/omakub/install/desktop/*.sh; do source $installer; done
for installer in ~/.local/share/omakub/install/desktop/gnome/*.sh; do source "$installer"; done
for installer in ~/.local/share/omakub/install/desktop/hyprland/*.sh; do source "$installer"; done

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
