setlocal spell
setlocal spellsuggest
set textwidth=79
setlocal formatexpr=

" Personal preference, I like to see the formatting modifiers
setlocal conceallevel=0

" Don't enable spell check for documentation windows from coc
augroup noPreviewSpell
    autocmd!
    autocmd BufRead,BufNewFile,BufEnter,BufLeave coc://document setlocal nospell
augroup END
