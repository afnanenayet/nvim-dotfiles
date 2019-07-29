let b:ale_linters = ['mdl', 'proselint']
"let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']
setlocal spell
setlocal spellsuggest
set textwidth=79
setlocal formatexpr=

" set tabwidth = 2 spaces for markdown
"setlocal tabstop=2
"setlocal shiftwidth=2
"nnoremap <buffer> <silent> gc :ALEFix<CR>
"let b:ale_fix_on_save=1

" Personal preference, I like to see the formatting modifiers
setlocal conceallevel=0

" Don't enable spell check for documentation windows from coc
augroup noPreviewSpell
    autocmd!
    autocmd BufRead,BufNewFile,BufEnter,BufLeave coc://document setlocal nospell
augroup END
