#!/bin/bash

# Source the environment variables needed to communicate with Hyprland
if [ -f "$HOME/.config/hypr/hypr_env.sh" ]; then
  source "$HOME/.config/hypr/hypr_env.sh"
  echo "Sourced Hyprland environment variables."
else
  # Exit if the env file doesn't exist, as hyprctl will fail
  exit 1
fi

current_hour=$(date +%H)

if ((current_hour >= 18 || current_hour < 6)); then
  hyprctl hyprsunset temperature 2500
else
  hyprctl hyprsunset identity
fi

exit 0
