nnoremap <space> <nop>
let mapleader=' '
let maplocalleader=' '

tnoremap <esc> <c-\><c-n>
nnoremap <expr> - empty(bufname()) ? ':edit .<cr>' : ':edit %:h<cr>'
