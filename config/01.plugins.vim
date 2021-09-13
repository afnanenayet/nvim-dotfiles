" Vim needs a POSIX compatible shell to work properly
if &shell =~# 'fish$'
    set shell=zsh
endif

if &compatible
    set nocompatible
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'Shougo/vimshell'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'roxma/nvim-yarp'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'neomutt/neomutt.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jamessan/vim-gnupg'
Plug 'justinmk/vim-dirvish'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'puremourning/vimspector', {'do' : 'python3 install_gadget.py --all'}
Plug 'tpope/vim-fugitive'
Plug 'neovimhaskell/haskell-vim'
Plug 'tpope/vim-eunuch'
Plug 'rust-lang/rust.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'lambdalisue/suda.vim'
Plug 'godlygeek/tabular'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'mhinz/vim-startify'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-sleuth'
Plug 'lervag/wiki.vim'
Plug 'christoomey/vim-conflicted'
Plug 'rhysd/vim-gfm-syntax'
Plug 'dag/vim-fish'
Plug 'tpope/vim-eunuch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'wincent/loupe'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()
