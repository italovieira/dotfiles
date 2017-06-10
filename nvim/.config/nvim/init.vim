set number
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set cursorline
set textwidth=80
set showcmd

" plug section
let s:f_plug = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')

if !filereadable(s:f_plug)
  execute '!curl -fLo ' . s:f_plug .
        \ ' --create-dirs' .
        \ ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
  call plug#begin('$HOME/.local/share/nvim/plugged')
  " General
  Plug 'neomake/neomake'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  " Colorschemes
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  call plug#end()
endif

syntax enable
set background=dark
silent! colorscheme gruvbox

filetype plugin indent on

" :h ft-syntax-omni
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif

if has('termguicolors')
    set termguicolors
endif

augroup Neomake
  autocmd!
  autocmd BufWritePost * silent! Neomake
augroup END
