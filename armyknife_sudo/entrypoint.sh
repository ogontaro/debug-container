#!/bin/bash

# Create .vimrc file with some basic settings
cat <<EOF >~/.vimrc
" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable auto-indentation
set autoindent
set smartindent

" Set search to be case insensitive unless using capital letters
set ignorecase
set smartcase

" Enable mouse support
set mouse=a

" Enable line wrapping
set wrap

" Highlight current line
set cursorline

" Set status bar
set laststatus=2

" Enable clipboard support
set clipboard=unnamedplus

" Set backup options
set backup
set backupdir=~/.vim/backups
set undodir=~/.vim/undo
set undofile

" Set encoding
set encoding=utf-8

" Set colorscheme
colorscheme desert

" Set command-line height
set cmdheight=1

" Reduce time waiting for a mapped sequence to complete
set timeoutlen=1000

" Enable file type detection
filetype plugin on
filetype indent on

" Set the ruler (display line and column number)
set ruler

EOF

# Create or append to Fish config file with fzf key binding
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

# Execute the passed command
exec "$@"
