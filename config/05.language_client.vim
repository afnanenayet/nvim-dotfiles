" language_client.vim contains vim settings specific to the language
" client plugin

" language server commands
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['ccls'],
            \ 'c': ['ccls'],
            \ 'python': ['/home/afnan/.virtualenvs/lang_server/bin/pyls'],
            \ 'rust': ['ra_lsp_server'],
            \ 'haskell': ['hie-wrapper']
            \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['compile_commands.json', 'build'],
            \ 'c': ['compile_commands.json', 'build'],
            \ 'haskell': ['*.cabal', 'stack.yaml'],
            \ 'rust': ['Cargo.toml'],
            \ }

set completefunc=LanguageClient#complete

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/afnan/.config/nvim/settings.json'
