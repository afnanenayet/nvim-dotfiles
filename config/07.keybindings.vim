" Use ; for commands
nnoremap ; :

" split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Delete trailing whitespace with F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" nerdtree
" autocmd vimenter * NERDTree " start nerdtree automatically when vim starts up
map <C-n> :NERDTreeToggle<CR>

" tab-completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" keybindings for language client
nnoremap <F4> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_codeAction()<CR>
nnoremap <silent> gc :call LanguageClient_textDocument_formatting()<CR>

" fzy
nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-s> :FuzzyGrep<CR>

" neosnippets
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            "\ '\<Plug>(neosnippet_expand_or_jump)' : '\<TAB>'


" Expand snippet when you hit enter on an entry
inoremap <silent> <expr> <CR> ncm2_neosnippet#expand_or("\<CR>", 'n')
inoremap <c-c> <ESC>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" change working directory to where the file in the buffer is located
" if user types `,cd`
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Easy most-recent-buffer switching
nnoremap <Tab> :buffers<CR>:buffer<Space>

" switch buffers
map <C-9> :bp<CR>
map <C-0> :bn<CR>
