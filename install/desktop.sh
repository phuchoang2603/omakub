#!/bin/bash

source ~/.local/share/omakub/install/lib/installer.sh

# Desktop applications and components
# Format: "Display Name:package1 package2 package3"
# Format for flatpak: "Display Name:flatpak:app.id"
# Format for script: "Display Name:script:script_name"
DESKTOP_APPS=(
  "Ghostty:ghostty"
  "VS Code:visual-studio-code-bin"
  "LibreOffice:libreoffice-fresh"
  "GNOME Apps:nautilus sushi gnome-keyring"
  "CopyQ:copyq"
  "Espanso:espanso-wayland-git"
  "Fcitx5:fcitx5 fcitx5-config-qt fcitx5-unikey"
  "Spotify:spotify-launcher spicetify-cli"
  "Microsoft Edge:microsoft-edge-stable-bin preload"
  "Obsidian:flatpak:md.obsidian.Obsidian"
  "LocalSend:localsend-bin"
  "Zotero:zotero-bin"
  "Auto-CPUFreq:auto-cpufreq"
  "Tailscale:tailscale"
  "Cloudflared Warp:cloudflared-warp-bin"
  "OBS Studio:obs-studio"
  "Pywal:python-pywal16"
  "Fonts:noto-fonts-cjk ttf-cascadia-mono-nerd ttf-ms-fonts texlive-fontsextra texlive-latexextra texlive-binextra"
  "GTK Themes (Graphite + GRUB):script:gtk-themes"
  "Rclone Sync:script:rclone"
  "GNOME Settings:script:gnome"
  "Hyprland Settings:script:hyprland"
)

echo "🎨 Setting up desktop environment..."

# Install desktop prerequisites (flatpak, base packages - REQUIRED)
source ~/.local/share/omakub/install/desktop/prerequisites.sh

# ========================================
# Desktop Apps & Components Selection
# ========================================
echo ""
echo "📦 Select Desktop Applications & Components"
echo "Enter space-separated numbers (e.g., '1 3 5'), or 'all':"
echo ""

# Display menu
for i in "${!DESKTOP_APPS[@]}"; do
  IFS=':' read -r display_name _ <<<"${DESKTOP_APPS[$i]}"
  printf "%2d) %s\n" $((i + 1)) "$display_name"
done

echo ""
read -p "Enter selection: " selection

# Parse selection
if [[ "$selection" == "all" ]]; then
  selected_indices=("${!DESKTOP_APPS[@]}")
else
  selected_indices=()
  for num in $selection; do
    idx=$((num - 1))
    if [[ $idx -ge 0 && $idx -lt ${#DESKTOP_APPS[@]} ]]; then
      selected_indices+=($idx)
    fi
  done
fi

# Install selected apps
if [ ${#selected_indices[@]} -gt 0 ]; then
  echo "Installing selected items..."
  for idx in "${selected_indices[@]}"; do
    app_def="${DESKTOP_APPS[$idx]}"
    IFS=':' read -r display_name install_type package <<<"$app_def"

    echo "→ Installing $display_name..."

    case "$install_type" in
    flatpak)
      flatpak install -y "$package" || INSTALL_ERRORS+=("Failed: $display_name")
      ;;
    script)
      case "$package" in
      gnome)
        for installer in ~/.local/share/omakub/install/desktop/gnome/*.sh; do
          source "$installer" || INSTALL_ERRORS+=("Failed: $(basename "$installer")")
        done
        ;;
      hyprland)
        for installer in ~/.local/share/omakub/install/desktop/hyprland/*.sh; do
          source "$installer" || INSTALL_ERRORS+=("Failed: $(basename "$installer")")
        done
        ;;
      *)
        source ~/.local/share/omakub/install/desktop/"$package.sh" ||
          INSTALL_ERRORS+=("Failed: $display_name")
        ;;
      esac
      ;;
    *)
      pkg $install_type || INSTALL_ERRORS+=("Failed: $display_name")
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
