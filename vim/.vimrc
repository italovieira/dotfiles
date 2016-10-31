set number
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set cursorline
set textwidth=80
set showcmd

" plug section
let s:f_plug = expand('$HOME/.vim/autoload/plug.vim')

if !filereadable(s:f_plug)
  execute '!curl -fLo ' . s:f_plug .
        \ ' --create-dirs' .
        \ ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
  call plug#begin()
  " Colorschemes
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  call plug#end()
endif

syntax enable
set background=dark
silent! colorscheme gruvbox

filetype plugin indent on

if has('termguicolors')
    set termguicolors
endif
