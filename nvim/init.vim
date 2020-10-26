" Reamp Esc to kj in insert mode
:imap kj <Esc>
:map <C-B> :b# <CR>

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
" set nowrap
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
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
" Show filename in status line
set statusline+=%F
" Don't add a newline to end of files
" when they are opened
set nofixendofline

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
" Rust
Plug 'rust-lang/rust.vim'
" Syntastic
Plug 'vim-syntastic/syntastic'
" Fuzzy Find
Plug 'junegunn/fzf.vim'
" Terraform
Plug 'hashivim/vim-terraform'
" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Set the default color scheme
colorscheme molokai

" NERDTree
" Close the NERDTree pane after opening a file
let NERDTreeQuitOnOpen = 1
" Always show hidden files in NERDTree
let NERDTreeShowHidden=1
" Make NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Map Ctrl+\ to toggle NERDTree
:map <C-\> :NERDTreeToggle<CR>

" vim-go
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet']
let g:go_build_tags = 'integration'
let g:go_addtags_transform = 'camelcase'
:autocmd BufWritePre *.go :GoMetaLinter
:autocmd BufWritePre *_test.go :GoTestCompile
:autocmd FileType go map <buffer> <C-i> :GoIfErr<CR>

" rust-vim
let g:rustfmt_autosave = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sh_checkers = []
let g:syntastic_java_checkers = []

" Terraform
let g:terraform_fmt_on_save=1

" Ctrl P
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,./vendor/*
let g:ctrlp_custom_ignore = '\v[\/]vendor$'
