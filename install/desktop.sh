#!/bin/bash

source ~/.local/share/omakub/install/lib/installer.sh

# Simple desktop applications (just paru/flatpak install)
# Format: "Display Name:package1 package2 package3"
# Format for flatpak: "Display Name:flatpak:app.id"
DESKTOP_SIMPLE=(
  "Ghostty:ghostty"
  "VS Code:visual-studio-code-bin"
  "LibreOffice:libreoffice-fresh"
  "GNOME Apps:nautilus sushi gnome-keyring"
  "CopyQ:copyq"
  "Espanso:espanso-wayland"
  "Fcitx5:fcitx5 fcitx5-config-qt fcitx5-unikey"
  "Spotify:spotify-launcher"
  "Microsoft Edge:microsoft-edge-stable-bin preload"
  "Obsidian:flatpak:md.obsidian.Obsidian"
  "LocalSend:localsend-bin"
  "Todoist:todoist-appimage"
  "Zotero:zotero-bin"
  "Auto-CPUFreq:auto-cpufreq"
  "Tailscale:tailscale"
  "Cloudflared Warp:cloudflared-warp-bin"
  "OBS Studio:obs-studio"
)

# Complex desktop components (need custom install logic)
# Format: "Display Name:installer_script_name"
DESKTOP_COMPLEX=(
  "GTK Themes (Graphite + GRUB):gtk-themes"
  "Pywal:pywal"
  "Fonts:fonts"
  "Rclone:rclone"
  "Steam:steam"
  "Timeshift:timeshift"
)

# DE/WM configurations
DESKTOP_CONFIGS=(
  "GNOME Settings"
  "Hyprland Settings"
)

echo "🎨 Setting up desktop environment..."

# Install desktop prerequisites (flatpak, base packages - REQUIRED)
source ~/.local/share/omakub/install/desktop/prerequisites.sh

# ========================================
# Simple Desktop Apps Selection
# ========================================
echo ""
echo "📦 Desktop Applications"
echo "Select applications to install (space-separated numbers, e.g., '1 3 5', or 'all'):"
echo ""

# Display menu
for i in "${!DESKTOP_SIMPLE[@]}"; do
  IFS=':' read -r display_name _ <<< "${DESKTOP_SIMPLE[$i]}"
  printf "%2d) %s\n" $((i+1)) "$display_name"
done

echo ""
read -p "Enter selection: " selection

# Parse selection
if [[ "$selection" == "all" ]]; then
  selected_indices=("${!DESKTOP_SIMPLE[@]}")
else
  selected_indices=()
  for num in $selection; do
    idx=$((num-1))
    if [[ $idx -ge 0 && $idx -lt ${#DESKTOP_SIMPLE[@]} ]]; then
      selected_indices+=($idx)
    fi
  done
fi

# Install selected apps
if [ ${#selected_indices[@]} -gt 0 ]; then
  echo "Installing selected applications..."
  for idx in "${selected_indices[@]}"; do
    app_def="${DESKTOP_SIMPLE[$idx]}"
    IFS=':' read -r display_name install_type package <<< "$app_def"
    
    echo "→ Installing $display_name..."
    
    if [[ "$install_type" == "flatpak" ]]; then
      flatpak install -y "$package" || INSTALL_ERRORS+=("Failed: $display_name")
    else
      pkg $install_type || INSTALL_ERRORS+=("Failed: $display_name")
    fi
  done
fi

# ========================================
# Complex Desktop Components Selection
# ========================================
echo ""
echo "🎨 Desktop Themes & Configurations"
echo "Select components to install (space-separated numbers, e.g., '1 3', or 'all'):"
echo ""

ALL_COMPLEX=("${DESKTOP_COMPLEX[@]}" "${DESKTOP_CONFIGS[@]}")

for i in "${!ALL_COMPLEX[@]}"; do
  IFS=':' read -r display_name _ <<< "${ALL_COMPLEX[$i]}"
  printf "%2d) %s\n" $((i+1)) "$display_name"
done

echo ""
read -p "Enter selection: " selection

# Parse selection
if [[ "$selection" == "all" ]]; then
  selected_indices=("${!ALL_COMPLEX[@]}")
else
  selected_indices=()
  for num in $selection; do
    idx=$((num-1))
    if [[ $idx -ge 0 && $idx -lt ${#ALL_COMPLEX[@]} ]]; then
      selected_indices+=($idx)
    fi
  done
fi

# Install selected components
if [ ${#selected_indices[@]} -gt 0 ]; then
  echo "Installing selected components..."
  for idx in "${selected_indices[@]}"; do
    selected="${ALL_COMPLEX[$idx]}"
    IFS=':' read -r display_name installer_name <<< "$selected"
    
    case "$display_name" in
      "GNOME Settings")
        for installer in ~/.local/share/omakub/install/desktop/gnome/*.sh; do
          source "$installer" || INSTALL_ERRORS+=("Failed: $(basename "$installer")")
        done
        ;;
      "Hyprland Settings")
        for installer in ~/.local/share/omakub/install/desktop/hyprland/*.sh; do
          source "$installer" || INSTALL_ERRORS+=("Failed: $(basename "$installer")")
        done
        ;;
      *)
        source ~/.local/share/omakub/install/desktop/"$installer_name.sh" || \
          INSTALL_ERRORS+=("Failed: $display_name")
        ;;
    esac
  done
fi

# Report errors
report_errors

echo "✅ Desktop setup complete!"

# Reboot prompt
read -p "Ready to reboot for all settings to take effect? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo reboot
fi
