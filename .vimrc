"" import plugins
set nocompatible
set rtp+=~/.vim/vundle.git
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/mru.vim'
Bundle 'SirVer/ultisnips'
Bundle 'flazz/vim-colorschemes'
"Bundle 'itchyny/lightline.vim'

"" general settings
set autoindent
set nobackup
set backspace=2
set guioptions=acei
set wildmenu
set wildmode=list:longest,full
set whichwrap+=h,l,<,>,[,]
set mouse=a
set hidden 
set autoindent
set nobackup
set noswapfile
set backspace=2
set guioptions=acei
set tabstop=4
set linebreak
set autochdir
syntax on
filetype plugin indent on

"" configure search
set nohlsearch
set ignorecase
set smartcase
set incsearch

"" spelling
set spellfile=~/.vim/spellfile.add

"" keybindings

" some bindings in normal mode
nnoremap 	+ 		:bnext <CR>
nnoremap 	- 		:bprevious <CR>
nnoremap 	, 		:
nnoremap 	<C-p>	:Mru 
nnoremap 	Q 		gqap

" remapping arrow keys
"nnoremap 	<up>	gk
"nnoremap 	<down>	gj
"inoremap 	<up>	<C-o>gk
"inoremap 	<down>	<C-o>gj
noremap <up> <NOP>
noremap <down> <NOP>
noremap <left> <NOP>
noremap <right> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

"" different themes

"colors asu1dark
colors biogoo
"colors navajo-night
