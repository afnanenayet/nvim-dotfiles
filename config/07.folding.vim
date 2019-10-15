" folding.vim
"
" Code folding related settings
" Generally, I want folding disabled by default, and we also control which
" filetypes use folding at all here.

" This opens folds when buffers are opened (I find it really annoying when
" folding is enabled off the bat instead of letting me toggle)
autocmd FileType * exe "normal zR"
autocmd FileType c,cpp,rust,vim,xml,html,javascript,typescript,go,haskell setlocal foldmethod=syntax
