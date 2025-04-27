#!/bin/bash
set -e

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/tmux"

cat >"${XDG_CONFIG_HOME:-$HOME/.config}/tmux/theme.conf" <<EOF
set -g @plugin 'dreamsofcode-io/catppuccin-tmux'
set -g @catppuccin_flavour 'mocha'
EOF
