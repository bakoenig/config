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
set guioptions=aceimT
set wildmenu
set wildmode=list:longest,full
set mouse=a
set hidden 
set nobackup
set noswapfile
set backspace=2
set tabstop=4
set linebreak
set autochdir
filetype plugin indent on
syntax on
"do not load MatchParen plugin
let loaded_matchparen = 1

"" configure search
set nohlsearch
set ignorecase
set smartcase
set incsearch

"" Ultisnips
let g:UltiSnipsListSnippets = '<f4>'

"" CTRL-P plugin
let g:ctrlp_map = '<f12>'
let g:ctrlp_cmd = 'CtrlPMRUFiles'

"" status line
set laststatus=2
let &statusline=' %F  %h%w%r%m  %Y [%{&fileformat}][%{strlen(&fenc)?&fenc:&enc}] %= (%2.l,%2.c) (%P) '

"" spelling
set spellfile=~/.vim/spellfile.add

"" abbreviations
ab teh the

"" keybindings
map 		<f2> 		:w<cr>
imap 		<f2> 		<esc>:w<cr>
nnoremap 	+ 			:bnext <CR>
nnoremap 	- 			:bprevious <CR>
nnoremap 	, 			:
nnoremap 	Q 			gqap

"" different themes
colors hybrid
"colors hybrid-light
"colors xoria256
