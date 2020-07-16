" init.vim contains all of the initialization plugins for vim note that this
" has to be sourced second since dein needs to run its scripts first. This
" contains misc startup settings for vim
let g:python3_host_prog = '~/.local/share/nvim/.venv/bin/python3'

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

" This will set folds disabled by default, but they can be toggled with zi
set nofoldenable

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

" live substitution for text edits
set inccommand=nosplit

" ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Overriding fzf.vim's default :Files command.  Pass zero or one args to Files
" command (which are then passed to Fzf_dev). Supports file path completion
" too.
command! -nargs=? -complete=file Files call Fzf_dev(<q-args>)

" Files w/preview
function! Fzf_dev(qargs)
  let l:fzf_files_options = '--preview "bat --style=numbers,changes --color always {} | head -'.&lines.'" --expect=ctrl-t,ctrl-v,ctrl-x --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all'

  function! s:files(dir)
    let l:cmd = $FZF_DEFAULT_COMMAND
    if a:dir != ''
      let l:cmd .= ' ' . shellescape(a:dir)
    endif
    let l:files = split(system(l:cmd), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      call add(l:result, printf('%s', l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(lines)
    let l:cmd = get({'ctrl-x': 'split',
                 \ 'ctrl-v': 'vertical split',
                 \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

    for l:item in a:lines[1:]
      let l:file_path = l:item
      execute 'silent ' . l:cmd . ' ' . l:file_path
    endfor
  endfunction

  call fzf#run({
        \ 'source': <sid>files(a:qargs),
        \ 'sink*':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

let g:suda_smart_edit = 1
