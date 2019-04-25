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
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neco-vim')
    call dein#add('ncm2/ncm2')
    call dein#add('ncm2/ncm2-syntax')
    call dein#add('ncm2/ncm2-path')
    call dein#add('ncm2/ncm2-neoinclude')
    call dein#add('ncm2/ncm2-neosnippet')
    call dein#add('ncm2/ncm2-vim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('icymind/NeoSolarized')
    call dein#add('tmhedberg/SimpylFold')
    call dein#add('Konfekt/FastFold')
    call dein#add('w0rp/ale')
    call dein#add('cloudhead/neovim-fuzzy')
    call dein#add('neomutt/neomutt.vim')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('jamessan/vim-gnupg')
    call dein#add('daeyun/vim-matlab')
    call dein#add('autozimu/LanguageClient-neovim', {
                \ 'rev': 'next',
                \ 'build': 'bash install.sh',
                \ })

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
