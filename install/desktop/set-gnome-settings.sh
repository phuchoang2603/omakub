# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Set Cascadia Mono as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

# Set Caps lock as Esc behavior
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Turn on night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2500

# Turn on battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Turn on hot corner
gsettings set org.gnome.desktop.interface enable-hot-corners true

