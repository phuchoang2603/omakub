if [ "$OMAKUB_OS_ID" == "arch" ]; then
  paru -S --noconfirm --needed extension-manager
elif [ "$OMAKUB_OS_ID" == "ubuntu" ]; then
  sudo apt install -y gnome-shell-extension-manager
fi
pipx install gnome-extensions-cli --system-site-packages

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Are you ready?"

# Install new extensions
gext install just-perfection-desktop@just-perfection
gext install space-bar@luchrioh
gext install tophat@fflewddur.github.io
gext install kimpanel@kde.org
gext install auto-move-windows@gnome-shell-extensions.gcampax.github.com
gext install Battery-Health-Charging@maniacx.github.com

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/auto-move-windows\@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.auto-move-windows.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
gsettings set org.gnome.shell.extensions.just-perfection window-maximized-on-create false

# Configure Space Bar
gsettings set org.gnome.shell.extensions.space-bar.behavior toggle-overview false
gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"
gsettings set org.gnome.shell.extensions.space-bar.shortcuts activate-previous-key "['<Shift><Super>l']"

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons true
gsettings set org.gnome.shell.extensions.tophat show-cpu true
gsettings set org.gnome.shell.extensions.tophat cpu-display numeric
gsettings set org.gnome.shell.extensions.tophat show-mem true
gsettings set org.gnome.shell.extensions.tophat mem-display numeric
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-fs true
gsettings set org.gnome.shell.extensions.tophat fs-display numeric
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bytes
