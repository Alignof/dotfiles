syntax on
autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#008800
highlight LineNr term=bold cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=Red guibg=NONE

hi Comment ctermfg=green
set t_Co=256

set autoindent
set tabstop=8 " 画面上でタブ文字が占める幅
set softtabstop=8 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=8 " smartindentで増減する幅

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

"set spell
"set spelllang=en,cjk 

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
	call dein#begin('/root/.cache/dein')

	" Required:
	call dein#add('/root/.cache/dein/repos/github.com/Shougo/dein.vim')

"	call dein#add('Shougo/deoplete.nvim')

	"call dein#add('Shougo/neco-vim') 
	"call dein#add('Shougo/neco-syntax')
	"call dein#add('ujihisa/neco-look')
	let g:deoplete#enable_at_startup = 1

	" Add or remove your plugins here like this:
	"call dein#add('Shougo/neosnippet.vim')
	"call dein#add('Shougo/neosnippet-snippets')
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
