
set nocompatible
set ruler
set showcmd
set nowrap
set lazyrdraw
set laststatus=2
set scrolloff=5
set ch=2
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smarttab
set incsearch
set hlsearch
set ignorecase
set autoread
set wildmenu
set autoindent 
set wildmode=list:longest,full
set backspace=indent,eol,start
set noerrorbells
set shell=bash
set cursorline
set directory=~/.vim/.swp//
syntax on 
"filetype plugin indent on 


command EditVim :edit ~/.vimrc 
command EditBash :edit ~/.bashrc

map <F12> :noh<CR>

map <Bar>   <C-W>v<C-W><Right>
map -       <C-W>s<C-W><Down>
map <Tab>   <C-W>w
map <Esc>[Z <C-W>W
map <C-c>   <C-W>c

nnoremap <Space> i<Space>
nnoremap <Del>   i<Del>


inoremap jj <Esc>

let g:clipbrdDefaultReg = '+'
highlight MatchParen ctermbg=4


try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browsesplit=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw:preview=1
