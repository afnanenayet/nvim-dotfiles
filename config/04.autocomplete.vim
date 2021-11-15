
" Enable the signcolumn for all filetypes that utilize diagnostics so there
" isn't an annoying shift effect when there are errors
augroup cocgutter
    autocmd!
    autocmd FileType tex,latex,cpp,haskell,vim,python,rust,go,c,json,yaml,bash,sh,css :setlocal signcolumn=yes
augroup end

