if &compatible
    set nocompatible
endif
filetype off
" append to runtime path
set rtp+=/usr/share/vim/vimfiles
" initialize dein, plugins are installed to this directory
call dein#begin(expand('~/.cache/dein'))

" add packages here, e.g:
call dein#add('sheerun/vim-polyglot')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/neco-syntax')
call dein#add('Shougo/neoinclude.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('roxma/nvim-yarp')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('scrooloose/nerdcommenter')
call dein#add('icymind/NeoSolarized')
call dein#add('tmhedberg/SimpylFold')
call dein#add('Konfekt/FastFold')
call dein#add('neomutt/neomutt.vim')
call dein#add('junegunn/fzf.vim')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('plasticboy/vim-markdown')
call dein#add('jamessan/vim-gnupg')
call dein#add('justinmk/vim-dirvish')
call dein#add('neoclide/coc.nvim', {'rev': 'release'})
call dein#add('puremourning/vimspector', {'do' : 'python3 install_gadget.py --all'})
call dein#add('tpope/vim-fugitive')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('tpope/vim-eunuch')
call dein#add('rust-lang/rust.vim')

" exit dein
call dein#end()
" auto-install missing packages on startup
if dein#check_install()
    call dein#install()
endif
filetype plugin on
