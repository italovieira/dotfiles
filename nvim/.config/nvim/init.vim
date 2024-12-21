runtime options.vim
runtime maps.vim
runtime commands.vim

lua require('plugins')
lua require('diagnostic')

silent! colorscheme gruvbox

syntax enable
set background=dark

filetype plugin indent on

" :h ft-syntax-omni
if has('autocmd') && exists('+omnifunc')
  autocmd Filetype *
        \ if &omnifunc == '' |
        \  setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

runtime extra.vim
