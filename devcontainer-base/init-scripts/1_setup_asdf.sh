#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ ! -d ~/.asdf ] ; then
  git clone --quiet --depth 1 https://github.com/asdf-vm/asdf.git ~/.asdf
  echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish
  mkdir -p ~/.config/fish/completions
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
fi
