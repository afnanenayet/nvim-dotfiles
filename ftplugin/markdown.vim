let b:ale_linters = ['mdl', 'proselint']
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']
let b:deoplete_disable_auto_complete = 1
setlocal spell
setlocal spellsuggest
set textwidth=79
set formatexpr=

" set tabwidth = 2 spaces for markdown
setlocal tabstop=2
setlocal shiftwidth=2
nnoremap <buffer> <silent> gc :ALEfix<CR>
let b:ale_fix_on_save = 1
