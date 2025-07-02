#!/bin/bash
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q 'MUTED'; then
  notify-send "Microphone Muted" -i microphone-sensitivity-muted -h string:x-canonical-private-synchronous:mic_mute
else
  notify-send "Microphone On" -i microphone-sensitivity-high -h string:x-canonical-private-synchronous:mic_mute
fi
