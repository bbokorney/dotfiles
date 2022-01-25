" Reamp Esc to kj in insert mode
imap kj <Esc>
map <C-b> :b#<CR>

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
set backspace=indent,eol,start

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
set laststatus=2
set statusline+=%f
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

set updatetime=300

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
" Terraform
Plug 'hashivim/vim-terraform'
" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Asynchronous linter
Plug 'dense-analysis/ale'
" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'tell-k/vim-autopep8'
Plug 'davidhalter/jedi-vim'
Plug 'maxmellon/vim-jsx-pretty'
" Typescript
Plug 'leafgarland/typescript-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
let g:syntastic_python_python_exec = 'python3'

" Terraform
let g:terraform_fmt_on_save=1

" Ctrl P
let g:ctrlp_custom_ignore = 'node_modules\|\v[\/]vendor$'

" TODO: clean this up, maybe no longer need it
" ALE
" let g:ale_completion_enabled = 1
" set omnifunc=ale#completion#OmniFunc
let g:ale_linters_explicit = 1
" let g:ale_linters = {'javascript': ['eslint'],'typescript': ['eslint'],'typescriptreact': ['tsserver','eslint', 'tslint']}
" let g:ale_fixers = {'javascript': ['eslint'],'typescript': ['eslint','tslint'],'typescriptreact': ['eslint','tslint']}
" let g:ale_fix_on_save = 1
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nnoremap K :ALEHover<CR>
" autocmd FileType javascript map <buffer> gd :ALEGoToDefinition<CR>
" autocmd FileType typescript map <buffer> gd :ALEGoToDefinition<CR>
" autocmd FileType typescriptreact map <buffer> gd :ALEGoToDefinition<CR>
" nnoremap <silent> gr :ALEFindReferences<CR>
" let g:ale_set_loclist = 1
" let g:ale_set_quickfix = 1
"

" AutoPEP8
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

" Python tags
set tags=tags
autocmd BufWritePost *.py silent! !ctags -R --python-kinds=-i --languages=python 2>; /dev/null &;
nnoremap gd <C-]>

" CoC
let g:coc_global_extensions = ['coc-json', 'coc-eslint', 'coc-tsserver', 'coc-go', 'coc-sh']

" Ctrl + k/j to move through diagnostic errors
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-g> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-g>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-g> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-g> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-g>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" When using go to definition, push location
" to tag stack.
function! s:goto_tag(tagkind) abort
  let tagname = expand('<cWORD>')
  let winnr = winnr()
  let pos = getcurpos()
  let pos[0] = bufnr()

  if CocAction('jump' . a:tagkind)
    call settagstack(winnr, { 
      \ 'curidx': gettagstack()['curidx'], 
      \ 'items': [{'tagname': tagname, 'from': pos}] 
      \ }, 't')
  endif
endfunction
nmap gd :call <SID>goto_tag("Definition")<CR>
nmap gi :call <SID>goto_tag("Implementation")<CR>
nmap gr :call <SID>goto_tag("References")<CR>

" Run go imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Change cursor depending on insert vs normal mode
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"
