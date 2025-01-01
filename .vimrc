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
"Plugin 'ycm-core/YouCompleteMe'

Plugin 'jpalardy/vim-slime'

call vundle#end()

color monokai
color monokai-phoenix

syntax on

filetype plugin indent on

set nobackup
set noswapfile
set number
set guifont=Monaco:h8
set colorcolumn=80
set hls

nmap <buffer> <leader>r <Esc>:w<CR>:!clear;ipython %<CR>
nmap <buffer> <leader>b oimport ipdb;ipdb.set_trace(context=5)<ESC>
nnoremap <leader>s :w<CR>
nnoremap <leader>t :stop<CR>
nmap <leader>f :Explore<CR>
nmap <leader><s-f> :edit<CR>
nnoremap <leader>aa ggVG
nnoremap <leader>nh :nohlsearch<CR>

let g:netrw_altv = 1
let g:netrw_dirhistmax = 0

let NERDTreeIgnore=['\pyc$', '\~$']
nnoremap <leader>nt :NERDTreeTabsToggle<CR>


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split
let g:slime_target = "tmux"    " For tmux users
let g:slime_python_ipython=1
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
