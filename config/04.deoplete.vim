"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

autocmd BufEnter * call ncm2#enable_for_buffer()
au TextChangedI * call ncm2#auto_trigger()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
