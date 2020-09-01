syntax on
autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#008800
highlight LineNr term=bold cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=Red guibg=NONE

hi Comment ctermfg=green
set t_Co=256

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.yml  setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab 
    autocmd BufNewFile,BufRead *.py   setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.tex  setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd BufNewFile,BufRead *.html setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.css  setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.scss setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

set autoindent
set tabstop=8 
set softtabstop=8 
set autoindent 
set smartindent 
set shiftwidth=8 

augroup vimrcEx
	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
				\ exe "normal g`\"" | endif
augroup END

set nowrap
set clipboard+=unnamed
"set clipboard=exclude:.*


" setting
set fenc=utf-8
set nobackup
set noswapfile
set hidden
set showcmd

set number
set virtualedit=onemore
set showmatch
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

vnoremap < <gv
vnoremap > >gv

nnoremap == gg=G''

set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

inoremap jj <Esc>

set backspace=indent,eol,start

if !has('gui_running')
	set timeout timeoutlen=1000 ttimeoutlen=50
endif

"dein Scripts------------------------------------------------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/root/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/root/.cache/dein')
	let g:deoplete#enable_at_startup = 1
	call dein#begin('/root/.cache/dein')

	" Required:
	call dein#add('/root/.cache/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('sophacles/vim-processing')
	call dein#add('thinca/vim-quickrun')


	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"https://qiita.com/Coolucky/items/0a96910f13586d635dc0
"https://qiita.com/yoza/items/2f8bd33a18225754f346
