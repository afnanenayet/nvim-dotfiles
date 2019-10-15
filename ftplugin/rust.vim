" Call rustfmt (or whatever formatting tool rls is using) on save
" :autocmd! BufWritePost <buffer> :LanguageClient#textDocument_formatting()
setlocal signcolumn=yes
