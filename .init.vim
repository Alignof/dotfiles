syntax on
autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#008800
highlight LineNr term=bold cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=Red guibg=NONE

hi Comment ctermfg=green
set t_Co=256

language C

source ~/.vim/my_script/bracket.vim

set showtabline=1

set wildmenu
set wildmode=longest:list,full
set autoindent
set tabstop=8 " 画面上でタブ文字が占める幅
set softtabstop=8 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅 set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=8 " smartindentで増減する幅

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.html setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

augroup vimrcEx
	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
				\ exe "normal g`\"" | endif
augroup END

function! My_running()
	if quickrun#is_running()
		return " Running... "
	else
		return ""
	endif
endfunction


set nowrap
set clipboard+=unnamed
"set clipboard=exclude:.*
set laststatus=0
set statusline=%F%m%r%h%w\%=
set statusline+=%{My_running()}
set statusline+=%c,%l/%L
set rulerformat=%100(%=%{My_running()}%c,%l/%L%)
"set rulerformat=%100(%f%m%r%h%w%=%{My_running()}%c,%l/%L%)
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
nnoremap YY gg"+yG''

set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

imap jj <Esc>
imap っj <Esc>

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
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	" Required:
	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here like this:
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
	call dein#add('sophacles/vim-processing')
	call dein#add('thinca/vim-quickrun')
			
	call dein#add('Shougo/neco-vim') 
	call dein#add('Shougo/neco-syntax')

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"https://qiita.com/Coolucky/items/0a96910f13586d635dc0
"https://qiita.com/yoza/items/2f8bd33a18225754f346

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_snipmate_compatibility = 1


let g:quickrun_config = {
		\	"_" : {
		\	"outputter/buffer/append":0,
		\	"outputter":"buffered",
		\	"outputter/buffered/target":"buffer",
		\	"outputter/buffer/split":"Uniqtab",
		\	"runner":"vimproc",
		\	"runner/vimproc/updatetime":0,
		\	},
		\	"python":{
		\	"command":"python3"
		\	},
		\}



"			\	"outputter/buffer/append":0,
"			\	"outputter/buffer/split":"Uniqtab",

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

if has('conceal')
	set conceallevel=2 concealcursor=niv
endif


inoremap <expr><tab> pumvisible() ? "\<C-n>" :
			\ neosnippet#expandable_or_jumpable() ?
			\    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"


"set snippet file dir
"let g:neosnippet#snippets_directory='~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets,~/.vim/snippets'


