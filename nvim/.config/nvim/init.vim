runtime options.vim
runtime maps.vim

syntax enable
set background=dark
silent! colorscheme gruvbox

filetype plugin indent on

" :h ft-syntax-omni
if has('autocmd') && exists('+omnifunc')
  autocmd Filetype *
        \ if &omnifunc == '' |
        \  setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

lua require('diagnostic')
lua require('plugins')

runtime extra.vim
