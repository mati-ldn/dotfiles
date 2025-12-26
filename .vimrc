" =====================================================
" Basic setup
" =====================================================
set nocompatible
syntax on
set encoding=utf-8
set nobackup
set noswapfile
set history=500
set number
set clipboard+=unnamedplus
set colorcolumn=80
set hlsearch
set incsearch
set showmode
set showmatch
set visualbell
set splitbelow splitright
set updatetime=300
set guifont=Consolas:h10
set scrolloff=3
set sidescrolloff=5

" =====================================================
" Leader keys
" =====================================================
let mapleader=" "
let maplocalleader=","

" =====================================================
" Plugin manager – Vundle
" =====================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Colors
Plugin 'sickill/vim-monokai'
Plugin 'reewr/vim-monokai-phoenix'

" File system
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'

" Git
Plugin 'tpope/vim-fugitive'

" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Tmux integration
Plugin 'jpalardy/vim-slime'

" Completion (optional)
" Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" =====================================================
" Theme
" =====================================================
try
  colorscheme monokai-phoenix
catch
  colorscheme monokai
endtry

" =====================================================
" Netrw tweaks
" =====================================================
let g:netrw_altv = 1
let g:netrw_dirhistmax = 0

" =====================================================
" Airline settings
" =====================================================
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" =====================================================
" NERDTree
" =====================================================
let g:NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <leader>nt :NERDTreeTabsToggle<CR>
nnoremap <leader>ntf :NERDTree %<CR>

" =====================================================
" Window / Tab navigation
" =====================================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <S-l> :tabnext<CR>
nnoremap <S-h> :tabprevious<CR>

nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k

" =====================================================
" Editing shortcuts
" =====================================================
nnoremap <leader>re :source ~/.vimrc<CR>
nnoremap <leader>s  :w<CR>
nnoremap <leader>q  :q<CR>
nnoremap <leader>ls :ls<CR>
nnoremap <leader>aa ggVG
nnoremap <leader>nh :nohlsearch<CR>

nmap <leader>f :Explore<CR>
nmap <leader>F :edit<CR>

" Buffer navigation
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

nnoremap <leader>T :tab split<CR>
nnoremap <leader>t :tab tag <C-r><C-w><CR>

" =====================================================
" Python run mappings (buffer-local)
" =====================================================
autocmd FileType python nnoremap <buffer> <leader>rr :w<CR>:!clear && ipython % &<CR>
autocmd FileType python nnoremap <buffer> <leader>dd :w<CR>:!clear && ipython --pdb % &<CR>
autocmd FileType python nnoremap <buffer> <leader>bb Obreakpoint()<ESC>

nnoremap <leader>bl :!black --skip-string-normalization --line-length=80 %<CR>
" Run Ruff and show errors in quickfix
nnoremap <leader>rf :silent! cexpr system('ruff check --quiet ' . expand('%'))<CR>:copen<CR>


" =====================================================
" Yank / Clipboard
" =====================================================
nnoremap <leader>y :call CopyLineOrSelection()<CR>
nnoremap <leader>yy :%w !clip.exe<CR>

function! CopyLineOrSelection()
  if mode() ==# 'v'
    normal! "+y
  else
    normal! "+yy
  endif
endfunction

" =====================================================
" Tmux pane opener for IPython
" =====================================================
function! OpenTmuxPaneAndRun()
  let cmd = "tmux split-window -v 'bash -i -c \"e1 && ipython; exec bash\"'"
  silent! call system(cmd)
endfunction
nnoremap <leader>i :call OpenTmuxPaneAndRun()<CR>

nnoremap <C-\><C-\> :call system("tmux kill-pane -t :.1")<CR>

" =====================================================
" Vim-slime
" =====================================================
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {
\ "socket_name": get(split($TMUX, ","), 0),
\ "target_pane": ":.1"
\ }

vmap <C-c><C-c> <Plug>SlimeRegionSend
nmap <C-c><C-c> <Plug>SlimeLineSend

nnoremap <leader>r :w<CR>ggVG<Plug>SlimeRegionSend<CR>

" =====================================================
" Toggle comment
" =====================================================
function! ToggleComment(...) range
  for lnum in range(a:firstline, a:lastline)
    let l:line = getline(lnum)
    if l:line =~ '^\s*#'
      call setline(lnum, substitute(l:line, '^\(\s*\)#', '\1', ''))
    else
      call setline(lnum, substitute(l:line, '^\(\s*\)', '\1#', ''))
    endif
  endfor
endfunction

nnoremap <silent> <leader>/ :call ToggleComment()<CR>
xnoremap <silent> <leader>/ :<C-u>call ToggleComment()<CR>

" =====================================================
" Python-mode settings (optional)
" =====================================================
if exists("g:pymode")
  let g:pymode_python = 'python3'
  let g:pymode_run = 1
  let g:pymode_breakpoint = 1
  let g:pymode_folding = 0
  let g:pymode_trim_whitespaces = 1
  let g:pymode_lint = 0
endif

" =====================================================
" Disable arrow keys to enforce hjkl
" =====================================================
for mode in ['n','i','v']
  execute mode . "noremap <Up> <Nop>"
  execute mode . "noremap <Down> <Nop>"
  execute mode . "noremap <Left> <Nop>"
  execute mode . "noremap <Right> <Nop>"
endfor

" =====================================================
" Git shortcuts
" =====================================================
nnoremap <leader>gs :!git status<CR>
nnoremap <leader>gco :!git checkout<CR>
nnoremap <leader>gb :!git branch<CR>
nnoremap <leader>ga :!git add %<CR>
nnoremap <leader>gc :!git commit<CR>
nnoremap <leader>gp :!git pull<CR>
nnoremap <leader>gps :!git push<CR>
nnoremap <leader>gl :!git log<CR>
nnoremap <leader>glp :!git log -p<CR>
nnoremap <leader>gls :!git log --stat<CR>
nnoremap <leader>gd :!git diff %<CR>
nnoremap <leader>gdc :!git diff --cached<CR>
nnoremap <leader>gre :!git restore<CR>

" Git commit + push shortcut
command! Gcp call GitCommitPush()
function! GitCommitPush()
  let msg = input("Commit message: ")
  if empty(msg)
    echo "Commit cancelled: empty message"
    return
  endif
  execute "!git add . && git commit -m " . shellescape(msg) . " && git push"
endfunction
nnoremap <Leader>gcp :Gcp<CR>

