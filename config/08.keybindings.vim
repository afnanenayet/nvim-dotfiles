" Use the spacebar as the leader key instead of `\`
map <Space> <Leader>

" split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent>gc :call CocAction('format')<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" nnoremap K :lua vim.lsp.buf.hover()<CR>

" Delete trailing whitespace with F5
:nnoremap <silent> <F2> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

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

nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>h :split<CR>

" execute the current line as a command
nnoremap <leader>e :exe getline(line('.'))<cr>

" shortcut to edit shell config
nnoremap <leader>sh :edit ~/.config/fish/config.fish<cr>

" shortcut to edit neovim config
nnoremap <leader>nv :edit ~/.config/nvim/config<cr>

" Find files using Telescope command-line sugar.
nnoremap <C-P> <cmd>Telescope find_files theme=get_dropdown<cr>
nnoremap <C-S> <cmd>Telescope live_grep theme=get_dropdown<cr>
nnoremap <leader>gf <cmd>Telescope git_files theme=get_dropdown<cr>
nnoremap <leader>fb <cmd>Telescope buffers theme=get_dropdown<cr>

" dap keybindings
nnoremap <leader>dh :lua require"dap".toggle_breakpoint()<CR>
nnoremap <leader>dH :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <leader>dst :lua require"dap".step_out()<CR>
nnoremap <leader>dsi :lua require"dap".step_into()<CR>
nnoremap <leader>dsv :lua require"dap".step_over()<CR>
nnoremap <leader>dct :lua require"dap".continue()<CR>
nnoremap <leader>dk :lua require"dap".up()<CR>
nnoremap <leader>dj :lua require"dap".down()<CR>
nnoremap <leader>dc :lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>
nnoremap <leader>dr :lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l
nnoremap <leader>di :lua require"dap.ui.variables".hover()<CR>
nnoremap <leader>di :lua require"dap.ui.variables".visual_hover()<CR>
nnoremap <leader>d? :lua require"dap.ui.variables".scopes()<CR>
nnoremap <leader>de :lua require"dap".set_exception_breakpoints({"all"})<CR>
nnoremap <leader>da :lua require"debugHelper".attach()<CR>
nnoremap <leader>dA :lua require"debugHelper".attachToRemote()<CR>
nnoremap <leader>di :lua require"dap.ui.widgets".hover()<CR>
nnoremap <leader>d? :lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>

" dashboard
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" nvim-hlslens
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>

" use : instead of <Cmd>
nnoremap <silent> <leader>l :noh<CR>
