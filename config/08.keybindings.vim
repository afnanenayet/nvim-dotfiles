" Use the spacebar as the leader key instead of `\`
map <Space> <Leader>

" split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Delete trailing whitespace with F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

command! -nargs=0 Format :call CocAction('format')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gc :call CocAction('format')<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-references)

" fzy
nnoremap <C-p> :Files<Cr>
nnoremap <C-s> :RG<CR>
nnoremap <C-m> :Marks<CR>

" neosnippets
imap <C-l> <Plug>(coc-snippets-expand)
imap <C-k> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,cpp,c,python,rust,go setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" grep word under cursor
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

" Keymapping for grep word under cursor with interactive mode
"nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
"nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" change working directory to where the file in the buffer is located
" if user types `,cd`
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Easy most-recent-buffer switching
nnoremap <Tab> :buffers<CR>:buffer<Space>
set wildchar=<Tab> wildmenu wildmode=full

" switch buffers
map <C-9> :bp<CR>
map <C-0> :bn<CR>

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>h :split<CR>

" s won't clobber the register
nnoremap s "_d

" execute the current line as a command
nnoremap <leader>e :exe getline(line('.'))<cr>

" shortcut to edit shell config
nnoremap <leader>sh :edit ~/.config/fish/config.fish<cr>

" shortcut to edit neovim config
nnoremap <leader>nv :edit ~/.config/nvim/config<cr>
