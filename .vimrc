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



** new

"---SETTINGS---
set nocompatible "some vi/vim compatibility
set showcmd "show current command
set ruler "display xy of cursor
set nowrap "dont wrap a line to the next
set nu "set numbers
colo encom "colorscheme
set mouse+=a "mouse support
set lazyredraw "dont redraw screen while in macro
set scrolloff=5 "set scolloffset 
set ch=2 "set command line 2 lines high
set wildmenu "tab out 
syntax on "allow syntax highlight
set noerrorbells "no error bells
set shell=bash "set the shell to bash
set cursorline "highlight the cursor line
set autoread "read the file when a change happens
set autoindent "automatically indent
set backspace=indent,eol,start "set what backspace will see
"searching
set incsearch "search incrementally
set hlsearch "highlight search
"case
set ignorecase "ignore case
set smartcase "case if the first letter is uppercase
"tab stuff
set shiftwidth=4 
set softtabstop=4 
set tabstop=4    
set expandtab   
set smarttab  
"toggle
"set list "view formatting characters
"set nohlsearch "highlighting is annoying

"---MAPPINGS---
"move current line up one
map <C-UP> :m . -2<CR>
"move current line down onw
map <C-DOWN> :m . +1<CR> 
"close current split
map <C-c> <C-W>c
"move to next buffer
map <C-b> :bnext<CR>
map <Tab> <C-W>w
"nnoremap <Space> i
"nnoremap <Del> i
"exit vim unconditionally
nnoremap <F3> :q!<CR><CR> 
"swap the file ext between .h and .C **for swapping header and source **todo fix 
"map <F4> :e % :p:s,.h$,.X123X,:s,.C$,.h,:s,.X123X$,.C,<CR>
"add block comments to visual block *fix
vmap <F12> d <esc>i/*<CR>*/<esc>kp 
"turn off highlight
nmap <F12> :noh<CR>
set pastetoggle=<F9> "toggle the paste

"---NETRW---
"use Ex 
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browsesplit=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_preview=1

"---STATUSLINE---
set laststatus=2 "two files
set statusline=%F "full filename 
set statusline+=%r
set statusline+=%y
set statusline+=%=
set statusline+=%c, "which column
set statusline+=%l/%L "which line out of max
set statusline+=\ %p%% "perecent of file

"---AUTOCMD---
""setup a prepend word for selected lines (useful for commenting)
"Control + \ prepends all selected lines
"Control + X removes the prepend from selected lines
"
augroup commentConfig
au!
"let prepend="//"
autocmd BufNewFile,BufRead *.vimrc let prepend="\""
autocmd BufNewFile,BufRead *.C let prepend="//"
autocmd BufNewFile,BufRead *.h let prepend="//"
noremap <C-\> :s/^/\=prepend/<CR> 
noremap <C-X> :s/<C-R><C-R>=prepend<CR>//<CR>
augroup END



"auto source vimrc when saving(in current session)
augroup VimConfig
au!
autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

"toggle relative numbers based on inserting
augroup numberToggle
au!
autocmd BufEnter,FocusGained,InsertLeave, * set rnu
autocmd BufLeave,FocusLost,InsertEnter, * set rnu!
augroup END


"---COMMANDS---
command! EditVim :edit ~/.vimrc "edit vim config file
"command! KillAll :!ps -ax |grep -v grep|awk '{print $1}'|xargs -n1 kill -9 "kill all the vims

"---Topics to search
"search and replace
"tab
"splits
"buffers
"paste
"vnew


