set number
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set cursorline
set textwidth=80

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

"Config HTML files
autocmd filetype html setlocal softtabstop=2 tabstop=2 shiftwidth=2

if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
