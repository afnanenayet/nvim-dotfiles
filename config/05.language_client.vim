" language_client.vim contains vim settings specific to the language
" client plugin

" language server commands
"\ 'cpp': ['ccls', '--log-file=/tmp/ccls.log'],
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['ccls'],
            \ 'c': ['ccls'],
            \ 'python': ['pyls'],
            \ 'rust': ['rls'],
            \ 'haskell': ['hie-wrapper'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'typescript': ['javascript-typescript-stdio'],
            \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
            \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['compile_commands.json', 'build', '.ccls', '.git'],
            \ 'c': ['compile_commands.json', 'build', '.ccls', '.git'],
            \ 'haskell': ['*.cabal', 'stack.yaml'],
            \ 'rust': ['Cargo.toml', '.git'],
            \ 'python' : ['.git'],
            \ }

"set completefunc=LanguageClient#complete

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/afnan/.config/nvim/settings.json'
