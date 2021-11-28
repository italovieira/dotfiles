set number
set expandtab
set shiftwidth=2
set softtabstop=-1
set cursorline
set textwidth=80
set showcmd
set list

" plug section
let s:f_plug = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')

if !filereadable(s:f_plug)
  execute '!curl -fLo ' . s:f_plug .
        \ ' --create-dirs' .
        \ ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
  call plug#begin('$HOME/.local/share/nvim/plugged')

  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'mhinz/vim-signify'

  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  let g:gruvbox_italic = 1

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  call plug#end()
endif

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
