#!/bin/bash

SOURCE_DIR="$HOME/repos/dotfiles/rofi/colors"
DEST_BASE="$HOME/.local/share/omakub/themes"

for file in "$SOURCE_DIR"/*.rasi; do
  # Extract the base name without extension (e.g., "catppuccin")
  theme_name=$(basename "$file" .rasi)
  dest_dir="$DEST_BASE/$theme_name"

  if [ -d "$dest_dir" ]; then
    cp "$file" "$dest_dir/rofi.rasi"
    echo "Copied $theme_name.rasi -> $dest_dir/rofi.rasi"
  else
    echo "Warning: $dest_dir does not exist. Skipping $theme_name."
  fi
done
