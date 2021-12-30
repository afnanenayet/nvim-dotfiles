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
Plug 'roxma/nvim-yarp'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'neomutt/neomutt.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jamessan/vim-gnupg'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'lambdalisue/suda.vim'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-conflicted'
Plug 'rhysd/vim-gfm-syntax'
Plug 'dag/vim-fish'
Plug 'tpope/vim-eunuch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'tpope/vim-rhubarb'
Plug 'navarasu/onedark.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ggandor/lightspeed.nvim'
Plug 'kevinhwang91/nvim-hlslens'

call plug#end()
