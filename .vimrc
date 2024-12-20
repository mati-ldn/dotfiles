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
Plugin 'jistr/vim-nerdree-tabs'

"Python
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'

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

nnoremap <leader>s :w<CR>
nnoremap <leader>aa ggVG
nnoremap <leader>nh :nohlsearch<CR>

let NERDTreeIgnore=['\pyc$', '\~$']
nnoremap <leader>nt :NERDTreeTabsToggle<CR>

