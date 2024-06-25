"-----------------------------dein Scripts---------------------------
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
    "------------------ complete --------------------
	call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('deoplete-plugins/deoplete-lsp')
    "--------------------------------------------

    call dein#add('rust-lang/rust.vim')
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('tomasr/molokai')
    call dein#add('ap/vim-css-color')
    call dein#add('kaarmu/typst.vim')

	" Required:
	call dein#end()
	call dein#save_state()
endif

" for complete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" ----------------------------------------------
" for format
let g:rustfmt_autosave = 1

" Required:
colorscheme molokai
let g:molokai_original = 1
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
filetype plugin indent on

