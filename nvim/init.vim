" Reamp Esc to kj in insert mode
:imap kj <Esc>

let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
   set clipboard=unnamed
elseif os == "Linux"
   set clipboard=unnamedplus
endif

" This vimrc is "inspired" by @moonglum, @garybernhardt and @railsbros-dirk
" Thanks to all of you for letting me steal your stuff :)

" Activate Syntax Highlight
syntax enable
" set default encoding to UTF-8
set encoding=utf-8

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase smartcase
" Ignore case when searching lowercase
set smartcase

" Deactivate Wrapping
set nowrap
" Treat all numbers as decimal
set nrformats=
" I don't like Swapfiles
set noswapfile
" Don't make a backup before overwriting a file.
set nobackup
" And again.
set nowritebackup
" show line numbers
set number
" MOAR colors
set t_Co=256
" Better buffer handling
set hidden
" hightlight cursor position
set cursorline


filetype plugin indent on
" Show existing tab with 2 spaces width
set tabstop=2
" When indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Color schemes
Plug 'tomasr/molokai'
" Nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Shows modified files via git in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Elixr
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Matching do + end
Plug 'tpope/vim-endwise'
" Golang
Plug 'fatih/vim-go'
" For commenting code
Plug 'tpope/vim-commentary'
" For surrounding things
Plug 'tpope/vim-surround'
" Shows modified lines via git in the gutter
Plug 'airblade/vim-gitgutter'
" Insert matching parens, brackets, quotes, etc
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Set the default color scheme
colorscheme molokai

" NERDTree
" Always show hidden files in NERDTree
let NERDTreeShowHidden=1
" Map Ctrl+\ to toggle NERDTree
:map <C-\> :NERDTreeToggle<CR>
" Map Ctrl+0 to toggle NERDTreeFocus
:map <C-0> :NERDTreeFocus<CR>

" vim-go
let g:go_fmt_command = "goimports"
