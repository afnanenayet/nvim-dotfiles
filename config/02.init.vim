" init.vim contains all of the initialization plugins for vim note that this
" has to be sourced second since dein needs to run its scripts first. This
" contains misc startup settings for vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set shell=/bin/sh

" Enable syntax highlighting
syntax on

" Fixes backspace
set backspace=indent,eol,start

" Enable line numbers
set number

" Enable line/column info at bottom
set ruler

set scrolloff=10
set updatetime=300

set nobackup
set nowritebackup

" Autoindentation
set autoindent
filetype indent plugin on

" Copies using system clipboard
set clipboard+=unnamedplus

" Tab = 4 spaces
set tabstop=4
set shiftwidth=4
" set sta
set expandtab
set softtabstop=4 " softtabstop, makes spaces feel like tabs when deleting
set cursorline

" enable mouse support
set mouse=a mousemodel=popup

" markdown file recognition
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.md.html set filetype=markdown

" relative line numbers
" Sets relative line numbers in normal mode, absolute line numbers in insert
" mode
set number
set relativenumber

" use ripgreg instead of grep
set grepprg=rg\ --vimgrep

" Set colors in terminal
" Solarized, dark, with true color support
set termguicolors
"set background=dark
colorscheme NeoSolarized

" crontab filetype tweak (the way vim normally saves files confuses crontab
" so this workaround allows for editing
au FileType crontab setlocal bkc=yes

set hidden
set nomodeline  " the modeline is a well-known security risk

" terminal settings
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" markdown settings
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1

" some language servers have problems with backup files
set nobackup
set nowritebackup

" more natural splits
set splitbelow
set splitright
