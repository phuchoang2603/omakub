# Favorite apps for dock
apps=(
  "microsoft-edge.desktop"
  "com.mitchellh.ghostty.desktop"
  # "Neovim.desktop"
  "code.desktop"
  "spotify-launcher.desktop"
  # "obsidian.desktop"
  "md.obsidian.Obsidian.desktop"
  "org.gnome.Nautilus.desktop"
)

# Array to hold installed favorite apps
installed_apps=()

# Directory where .desktop files are typically stored
desktop_dirs=(
  "/var/lib/flatpak/exports/share/applications"
  "/usr/share/applications"
  "/usr/local/share/applications"
  "$HOME/.local/share/applications"
)

# Check if a .desktop file exists for each app
for app in "${apps[@]}"; do
  for dir in "${desktop_dirs[@]}"; do
    if [ -f "$dir/$app" ]; then
      installed_apps+=("$app")
      break
    fi
  done
done

# Convert the array to a format suitable for gsettings
favorites_list=$(printf "'%s'," "${installed_apps[@]}")
favorites_list="[${favorites_list%,}]"

# Set the favorite apps
gsettings set org.gnome.shell favorite-apps "$favorites_list"

# Configure Auto Move Windows
gsettings set org.gnome.shell.extensions.auto-move-windows application-list "['microsoft-edge.desktop:1', 'com.mitchellh.ghostty.desktop:2', 'code.desktop:3', 'spotify-launcher.desktop:4', 'md.obsidian.Obsidian.desktop:5', 'org.gnome.Nautilus.desktop:6']"
