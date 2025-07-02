#!/bin/bash

# A script to control and notify volume changes using wpctl.

# Function to send a notification
send_notification() {
  # Get current volume and mute status
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
  is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q 'MUTED' && echo "yes" || echo "no")

  # Set icon and text based on mute status
  if [ "$is_muted" = "yes" ]; then
    icon="audio-volume-muted"
    text="Volume: Muted"
  else
    icon="audio-volume-high"
    text="Volume: ${volume}%"
  fi

  # Send the notification
  notify-send "$text" -i "$icon" -h int:value:"$volume" -h string:x-canonical-private-synchronous:volume
}

# Main logic
case $1 in
up)
  wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
  send_notification
  ;;
down)
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  send_notification
  ;;
mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  send_notification
  ;;
esac
