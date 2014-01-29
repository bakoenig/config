"" import plugins
set nocompatible
set rtp+=~/.vim/vundle.git
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 's-urbaniak/xoria256'
Bundle 'w0ng/vim-hybrid'
Bundle 'kien/ctrlp.vim'

"" general settings
set autoindent
set nobackup
set backspace=2
set guioptions=acei
set wildmenu
set wildmode=list:longest,full
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
filetype plugin indent on
syntax on

"" configure search
set nohlsearch
set ignorecase
set smartcase
set incsearch

"" CTRL-P plugin
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_working_path_mode = '0'

"" Ultisnips
let g:UltiSnipsListSnippets = '<f4>'

"" status line
set laststatus=2
let &statusline=' %F  %h%w%r%m  %Y [%{&fileformat}][%{strlen(&fenc)?&fenc:&enc}] %= (%2.l,%2.c) (%P) '

"" spelling
set spellfile=~/.vim/spellfile.add

"" keybindings

" some bindings in normal mode
map 		<f2> 		:w<cr>
imap 		<f2> 		<esc>:w<cr>
nnoremap 	+ 			:bnext <CR>
nnoremap 	- 			:bprevious <CR>
nnoremap 	, 			:
nnoremap 	Q 			gqap

" remapping arrow keys
"nnoremap 	<up>	gk
"nnoremap 	<down>	gj
noremap <up> <NOP>
noremap <down> <NOP>
noremap <left> <NOP>
noremap <right> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

"" different themes

"colors jellybeans
colors hybrid
"colors xoria256
