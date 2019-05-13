set nocompatible

filetype plugin on
syntax on
set laststatus=0
set encoding=utf-8
set autoindent
set incsearch
set hlsearch
set hidden
set viminfo="-"
set clipboard=unnamedplus
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set number
set relativenumber
set nobackup
set nowritebackup
set noundofile
set bg=dark
set modeline
set modelines=5
set noshowmode
set showcmd
set conceallevel=2
set wildmenu
set wildmode=longest,list,full
set mouse=a
set scrolloff=5
set foldmethod=indent
set foldlevel=99
set splitbelow
set splitright
set fileformat=unix
set nolist

" change <paste> command behaviour
xnoremap p "_dp
xnoremap P "_dP

" disable Ex mode
nnoremap Q <nop>

" annoying keys
command! Q :q
command! W :w
command! WQ :wq
command! Wq :wq
command! -bang Q :q<bang>

" normal mode bindings
nnoremap <silent> gr :noh<Enter>
nnoremap Y y$

" moving in insert mpde
inoremap <C-H> <Left>
inoremap <C-L> <Right>

if (&term!='linux')
    " different cursors per mode
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif

" buffer manipulation
nn <silent> <A-h> :bprev<CR>
nn <silent> <A-l> :bnext<CR>
