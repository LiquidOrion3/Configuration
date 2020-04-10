set nocompatible
set ruler
set showcmd
set nowrap
set lazyredraw
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
set smartcase
set autoread
set autoindent 
set wildmenu
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

augroup config
au!
autocmd bufwritepost .vimrc source %
autocmd bufwritepost .bashrc source %
augroup END

map <F12> :noh<CR>
map <Bar>   <C-W>v<C-W><Right>
map -       <C-W>s<C-W><Down>
map <Tab>   <C-W>w
map <Esc>[Z <C-W>W
map <C-c>   <C-W>c

nnoremap <Space> i<Space>
nnoremap <Del>   i<Del>

inoremap jj <Esc>

highlight MatchParen ctermbg=4

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

let g:clipbrdDefaultReg = '+'
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browsesplit=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw:preview=1


set paste
set nopaste

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction


nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

in insert mode
Contrl P 
Contrl N 

nnoremap <F3> :q!<CR><CR>

:!ps -ax |grep -v grep |awk '{print $1}' |xargs -n1 kill -9

vmap <F12> dd<esc>i/*<CR>*/<esc>kp
let g:front="'//"
noremap <C-\> :s/^/\=g:front<CR> :noh<CR>

map <C-UP> Lm . -2<CR>
map <C-DOWN> :m .+1<CR>

augroup numberToggle
au!
autocmd BufEnter,FocusGained,InsertLeave, *set rnu
autocmd BufLeave,FocusLost,InsertEnter, * set rnu!

