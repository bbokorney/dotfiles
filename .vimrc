" Reamp Esc to kj in insert mode
:imap kj <Esc>

filetype plugin indent on
" Show existing tab with 3 spaces width
set tabstop=3
" When indenting with '>', use 3 spaces width
set shiftwidth=3
" On pressing tab, insert 3 spaces
set expandtab
" System clipboard as buffer
set clipboard=unnamedplus
" Run Autoformat when a buffer is saved
au BufWrite * :Autoformat
" Load plugins with Pathogen
execute pathogen#infect()
" Set the default color scheme
colorscheme molokai
" Map Ctrl+\ to toggle NERDTree
:map <C-\> :NERDTreeToggle<CR>
" Always show hidden files in NerdTree
let NERDTreeShowHidden=1
