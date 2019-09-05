" Required:
set runtimepath+=/home/afnan/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/afnan/.cache/dein')
    call dein#begin('/home/afnan/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/home/afnan/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
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
    call dein#add('sakhnik/nvim-gdb', {'do' : 'bash install.sh'})
    call dein#add('tpope/vim-fugitive')

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------
