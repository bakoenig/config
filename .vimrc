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
syntax on
filetype plugin indent on

"" configure search
set nohlsearch
set ignorecase
set smartcase
set incsearch

""CTRL-P plugin
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'c'

"" status line
set laststatus=2
let &statusline=' %F  %h%w%r%m  %Y [%{&fileformat}][%{strlen(&fenc)?&fenc:&enc}] %= (%2.l,%2.c) (%P) '

"" spelling
set spellfile=~/.vim/spellfile.add

"" keybindings

" some bindings in normal mode
nnoremap 	+ 			:bnext <CR>
nnoremap 	- 			:bprevious <CR>
nnoremap 	, 			:
nnoremap 	<C-o> 		:Mru 
nnoremap 	Q 			gqap

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

"colors jellybeans
"colors hybrid
colors xoria256
