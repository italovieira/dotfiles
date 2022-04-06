set number
set expandtab
set shiftwidth=2
set softtabstop=-1
set cursorline
set textwidth=80
set showcmd
set list
set undofile

let mapleader=' '
let maplocalleader=' '

syntax enable
set background=dark
silent! colorscheme gruvbox

filetype plugin indent on

" :h ft-syntax-omni
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \  setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

if has('termguicolors')
  set termguicolors
endif

lua << EOF
-- source remaining config
require('lsp')
require('plugins')
EOF
