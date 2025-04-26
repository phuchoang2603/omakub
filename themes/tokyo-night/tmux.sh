#!/bin/bash
set -e

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"

cat >"${XDG_CONFIG_HOME:-$HOME/.config}/tmux/theme.conf" <<EOF
set -g @plugin 'fabioluciano/tmux-tokyo-night'
set -g @theme_variation 'storm'
set -g @theme_disable_plugins '1'
EOF
