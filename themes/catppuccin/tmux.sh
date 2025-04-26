#!/bin/bash
set -e

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"

cat >"${XDG_CONFIG_HOME:-$HOME/.config}/tmux/theme.conf" <<EOF
set -g @plugin 'catppuccin/tmux#v2.1.3'
set -g @catppuccin_flavor 'mocha'
EOF
