runtime options.vim
runtime maps.vim
runtime commands.vim

set background=dark

" :h ft-syntax-omni
if has('autocmd') && exists('+omnifunc')
  autocmd Filetype *
        \ if &omnifunc == '' |
        \  setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

runtime extra.vim
