" init.vim contains all of the initialization plugins for vim note that this
" has to be sourced second since dein needs to run its scripts first. This
" contains misc startup settings for vim
let g:python3_host_prog = '~/.local/share/nvim/.venv/bin/python3'

filetype plugin on
syntax enable

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set shell=/usr/local/bin/fish

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
set signcolumn=number

" Autoindentation
set autoindent
filetype indent plugin on

" Copies using system clipboard
set clipboard+=unnamedplus

" Tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4 " softtabstop, makes spaces feel like tabs when deleting

" underline cursor instead of highlight
set cursorline
"hi clear CursorLine
"hi CursorLine gui=underline cterm=underline

" This will set folds disabled by default, but they can be toggled with zi
set nofoldenable

" enable mouse support
set mouse=a mousemodel=popup

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
set background=dark
"colorscheme solarized
colorscheme onedark

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

" live substitution for text edits
set inccommand=nosplit

" ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

let g:suda_smart_edit = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:dashboard_default_executive = 'telescope'

"set completeopt=menuone,noselect
set shortmess+=c
