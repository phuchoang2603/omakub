#!/bin/bash

current_hour=$(date +%H)

if ((current_hour >= 18 || current_hour < 6)); then
  hyprctl hyprsunset temperature 2500
else
  hyprctl hyprsunset identity
fi

exit 0
