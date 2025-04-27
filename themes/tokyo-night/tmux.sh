#!/bin/bash
set -e

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"

cat >"${XDG_CONFIG_HOME:-$HOME/.config}/tmux/theme.conf" <<EOF
set -g @plugin "janoamaral/tokyo-night-tmux"
set -g @tokyo-night-tmux_theme storm
EOF
