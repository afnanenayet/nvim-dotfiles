" deoplete.vim contains vim settings relevant to the deoplete autocompletion
" plugin

" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

call deoplete#custom#option('sources', {
            \ 'python': ['LanguageClient'],
            \ 'python3': ['LanguageClient'],
            \ 'cpp': ['LanguageClient'],
            \ 'c': ['LanguageClient'],
            \ 'rust': ['LanguageClient'],
            \ 'vim': ['vim'],
            \})

" ignored sources
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']
