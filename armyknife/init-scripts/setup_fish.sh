#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

mkdir -p ~/.config/fish
cat <<EOF >>~/.config/fish/config.fish
source /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish
if status is-interactive
    fzf_key_bindings
    bind \cf fzf-cd-widget
end
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow -uu'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
EOF
