set t_Co=256
syntax enable
language C

nmap gl gt
nmap gh gT
nmap <Esc><Esc> :nohlsearch<CR><Esc>

nnoremap j gj
nnoremap k gk
nnoremap == gg=G''
nnoremap YY gg"+yG''

vnoremap < <gv
vnoremap > >gv

inoremap <silent> jj <Esc>

set wildmenu
set wildmode=longest:list,full
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set expandtab
set incsearch
set wrapscan
set hlsearch
set smartcase
set backspace=indent,eol,start
set nowrap
set nobackup
set noswapfile
set number
set hidden
set showcmd
set showmatch
set showtabline=1
set clipboard+=unnamed,unnamedplus
set laststatus=0
set statusline=%F%m%r%h%w\%=
set statusline+=%c,%l/%L
set fenc=utf-8
set virtualedit=onemore
set conceallevel=0

let g:tex_conceal=''
let g:tex_no_error=1
let g:vim_markdown_conceal=0

augroup vimrcEx
	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
				\ exe "normal g`\"" | endif
augroup END

runtime! ./plugin.vim
runtime! ./rust_analyzer.vim
