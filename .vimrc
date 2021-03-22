"Commands
command! Cleanfile normal! :%s/\s\+$//g<CR>
"command! BashTemplate
"command! FunctionTemplate

"Mappings
let mapleader =" "
nnoremap <leader>1 :tabn 1 <CR>
nnoremap <leader>2 :tabn 2 <CR>
nnoremap <leader>3 :tabn 3 <CR>
nnoremap <leader>4 :tabn 4 <CR>
nnoremap <leader>5 :tabn 5 <CR>
nnoremap <leader>6 :tabn 6 <CR>
nnoremap <leader>7 :tabn 7 <CR>
nnoremap <leader>8 :tabn 8 <CR>
nnoremap <leader>9 :tabn 9 <CR>
nnoremap <leader>e :e ~/.vimrc<CR>
nnoremap <leader>o :Lex <CR>
nnoremap <leader>sr :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>h :noh<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprev<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>r :.1
nnoremap <leader>w <C-w>w
nnoremap <leader>n :enew<CR>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+1<CR>gv-gv
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nmap ; :
vnoremap jk <ESC>
inoremap jk <ESC>
map <F3> :q!<CR><CR>
map <F4> :e %:p:s,.h$,.X123X,:s,.C$,.h,:s,.X123X$,.C,<CR>

"Functionality
"au Vimenter * if eval("@%") ==""|e ~/.vim/startup.vim| endif
set pumheight=5
set lazyredraw
set autoread
set autoindent
set incsearch
set hlsearch
set ignorecase
set smartcase
set mouse+=a
set nocompatible
set backspace=indent,eol,start
set noerrorbells
set hidden
set confirm
set showmode
set path+=**
set directory=~/.vim/.swp//
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamedplus
autocmd SwapExists * let v:swapchoice = "e"
autocmd bufwritepost .vimrc source %
augroup commentConfig
  au!
  autocmd BufEnter * let prepend="#"
  autocmd BufEnter *.bashrc let prepend="#"
  autocmd BufEnter *.vimrc let prepend="\""
  autocmd BufEnter *.C let prepend="//"
  autocmd BufEnter *.h let prepend="//"
  noremap <C-\> :s/^/\=prepend/<CR>  :noh<CR>
  noremap <C-X> :s/<C-R><C-R>=prepend<CR>//<CR> :noh<CR>
augroup END

"Formatting
set wildmenu
set wildmode=list,longest,full
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smarttab
set ruler
set scrolloff=5
set cursorline
set showcmd
set nowrap
syntax on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup nuToggle
  set number
  autocmd BufEnter,FocusGained,InsertLeave, * set rnu
  autocmd BufLeave,FocusLost,InsertEnter, * set rnu!
augroup end

"NETRW
let g:clipbrdDefaultReg = '+'
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browsesplit=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_preview=1

"Fixpaste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
