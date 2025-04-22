# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Set Cascadia Mono as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

# Set Caps lock as Esc behavior
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Check if the user have com.ubuntu.touch.system, then implement the following
if gsettings list-recursively com.ubuntu.touch.system > /dev/null 2>&1; then
    # Set the touch screen to be disabled when the keyboard is open
    gsettings set com.ubuntu.touch.system auto-brightness false
fi