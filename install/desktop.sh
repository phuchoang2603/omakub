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
# Simple Desktop Apps (gum multi-select)
# ========================================
echo ""
echo "📦 Desktop Applications"

# Extract display names for gum
SIMPLE_NAMES=()
for app_def in "${DESKTOP_SIMPLE[@]}"; do
  IFS=':' read -r display_name _ <<< "$app_def"
  SIMPLE_NAMES+=("$display_name")
done

selected_simple=$(gum choose "${SIMPLE_NAMES[@]}" \
  --no-limit \
  --height 20 \
  --header "Select desktop applications")

if [[ -n "$selected_simple" ]]; then
  echo "Installing selected applications..."
  
  while IFS= read -r selected; do
    # Find matching app definition
    for app_def in "${DESKTOP_SIMPLE[@]}"; do
      IFS=':' read -r display_name install_type package <<< "$app_def"
      
      if [[ "$display_name" == "$selected" ]]; then
        echo "→ Installing $display_name..."
        
        if [[ "$install_type" == "flatpak" ]]; then
          flatpak install -y "$package" || INSTALL_ERRORS+=("Failed: $display_name")
        else
          # install_type is actually the package name(s) for paru
          pkg $install_type || INSTALL_ERRORS+=("Failed: $display_name")
        fi
        break
      fi
    done
  done <<< "$selected_simple"
fi

# ========================================
# Complex Desktop Components (gum multi-select)
# ========================================
echo ""
echo "🎨 Desktop Themes & Configurations"

ALL_COMPLEX=("${DESKTOP_COMPLEX[@]}" "${DESKTOP_CONFIGS[@]}")

# Extract display names
COMPLEX_NAMES=()
for item in "${ALL_COMPLEX[@]}"; do
  IFS=':' read -r display_name _ <<< "$item"
  COMPLEX_NAMES+=("$display_name")
done

selected_complex=$(gum choose "${COMPLEX_NAMES[@]}" \
  --no-limit \
  --height 15 \
  --header "Select themes and configurations")

if [[ -n "$selected_complex" ]]; then
  echo "Installing selected components..."
  
  while IFS= read -r selected; do
    case "$selected" in
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
        # Find installer script name from DESKTOP_COMPLEX
        for complex_def in "${DESKTOP_COMPLEX[@]}"; do
          IFS=':' read -r display_name installer_name <<< "$complex_def"
          if [[ "$display_name" == "$selected" ]]; then
            source ~/.local/share/omakub/install/desktop/"$installer_name.sh" || \
              INSTALL_ERRORS+=("Failed: $display_name")
            break
          fi
        done
        ;;
    esac
  done <<< "$selected_complex"
fi

# Report errors
report_errors

echo "✅ Desktop setup complete!"

# Reboot prompt
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
