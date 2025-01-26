set nocompatible
filetype off

let mapleader= ","


set rtp +=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Colors
Plugin 'sickill/vim-monokai'
Plugin 'reewr/vim-monokai-phoenix'

" File system
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"Python
"Plugin 'python-mode/python-mode'
"Plugin 'davidhalter/jedi-vim'

" Others
Plugin 'jpalardy/vim-slime'

call vundle#end()

color monokai
color monokai-phoenix

syntax on

filetype plugin indent on

set nobackup
set noswapfile
set number
set guifont=Consolas:h10
set colorcolumn=80
set hls
set showmode
set clipboard+=unnamedplus
set vb
set showmatch

set splitbelow
set splitright

nnoremap <leader>re :source ~/.vimrc<CR>
nmap <buffer> <leader>rr <Esc>:w<CR>:!clear;ipython %<CR>
nmap <buffer> <leader>dd <Esc>:w<CR>:!clear;ipython --pdb %<CR>
"nmap <buffer> <leader>d : terminal ipython --pdb %<CR>
nmap <buffer> <leader>bb Oimport ipdb;ipdb.set_trace(context=5)<ESC>
nnoremap <leader>bl :!black --skip-string-normalization --line-length=80 %<cr>
nnoremap <leader>s :w<CR>
nnoremap <leader>t :stop<CR>
nnoremap <leader>ls :ls<CR>
nmap <leader>f :Explore<CR>
nmap <leader><s-f> :edit<CR>
nnoremap <leader>aa ggVG
nnoremap <leader>nh :nohlsearch<CR>

nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k

noremap <s-l> gt
noremap <s-h> gT

let g:netrw_altv = 1
let g:netrw_dirhistmax = 0

let NERDTreeIgnore=['\pyc$', '\~$']
nnoremap <leader>nt :NERDTreeTabsToggle<CR>


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <S-L> :tabnext<CR>
nnoremap <S-H> :tabprevious<CR>

" Disable arrow keys in normal mode
nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>

" Disable arrow keys in insert mode
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>

" Disable arrow keys in visual mode
vnoremap <Up>    <Nop>
vnoremap <Down>  <Nop>
vnoremap <Left>  <Nop>
vnoremap <Right> <Nop>


function! OpenTmuxPaneAndRunAliasThenIPython()
    " Open a new tmux pane below, source aliases, and run ipython
        let l:command = "tmux split-window -v 'bash -i -c \"activ && ipython; exec bash\"'"
	silent! call system(l:command)
endfunction

" Map the function to a key (e.g., <leader>a for alias + ipython)
nnoremap <leader>i :call OpenTmuxPaneAndRunAliasThenIPython()<CR>

noremap <leader>yy :%w !clip.exe<CR>
nnoremap <leader>y :call CopyLineOrSelection()<CR>

function! CopyLineOrSelection()
  if mode() ==# 'v'
    normal! "+y
  else
    normal! "+yy
  endif
endfunction

" for vim-slime 
let g:slime_target = "tmux"    " For tmux users
let g:slime_python_ipython=1
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

" python-mode
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_run = 1
let g:pymode_breakpoint = 1
let g:pymode_folding = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_lint = 0

" jedi-vim
" Enable autocompletion
"let g:jedi#completions_enabled = 1
" Use the same Python interpreter as the current environment
"let g:jedi#use_tabs_not_buffers = 1

