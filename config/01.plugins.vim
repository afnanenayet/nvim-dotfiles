if &compatible
    set nocompatible
endif

" append to runtime path
" Required:
set runtimepath+=/usr/local/opt/fzf
set runtimepath+=/Users/afnanenayet/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/afnanenayet/.cache/dein')
    " Required:
    call dein#begin('/Users/afnanenayet/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/Users/afnanenayet/.cache/dein/repos/github.com/Shougo/dein.vim')

    " add packages here, e.g:
    call dein#add('wsdjeg/dein-ui.vim')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('Shougo/vimshell')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('roxma/nvim-yarp')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('overcache/NeoSolarized')
    call dein#add('tmhedberg/SimpylFold')
    call dein#add('Konfekt/FastFold')
    call dein#add('neomutt/neomutt.vim')
    call dein#add('junegunn/fzf.vim')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('jamessan/vim-gnupg')
    call dein#add('justinmk/vim-dirvish')
    call dein#add('neoclide/coc.nvim', {'rev': 'release'})
    call dein#add('puremourning/vimspector', {'do' : 'python3 install_gadget.py --all'})
    call dein#add('tpope/vim-fugitive')
    call dein#add('neovimhaskell/haskell-vim')
    call dein#add('tpope/vim-eunuch')
    call dein#add('rust-lang/rust.vim')
    call dein#add('jlanzarotta/bufexplorer')
    call dein#add('lambdalisue/suda.vim')
    call dein#add('godlygeek/tabular')
    call dein#add('vimwiki/vimwiki')
    call dein#add('vim-pandoc/vim-pandoc')
    call dein#add('vim-pandoc/vim-pandoc-syntax')
    " Required:
    call dein#end()
    call dein#save_state()
endif

filetype plugin on
syntax enable

" auto-install missing packages on startup
if dein#check_install()
    call dein#install()
endif
