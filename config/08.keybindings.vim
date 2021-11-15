" Use the spacebar as the leader key instead of `\`
map <Space> <Leader>

" split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
