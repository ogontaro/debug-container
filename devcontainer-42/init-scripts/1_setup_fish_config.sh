#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

mkdir -p ~/.config/fish
cat <<EOF >>~/.config/fish/config.fish
alias c_formatter_42="python3 -m c_formatter_42"
alias norminette="python3 -m norminette"
alias norm="norminette"
alias cat="bat"
alias du="duf"
EOF
