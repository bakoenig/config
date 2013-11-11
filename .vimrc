"" general settings

set nocompatible
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

"vundle config
filetype off
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle ''Lokaltog/powerline'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/UltiSnips'
Bundle 'vim-scripts/Colour-Sampler-Pack'

" configure search
set nohlsearch
set ignorecase
set smartcase
set incsearch

" status line
set laststatus=2                             	" always show statusbar  
"set statusline=  
"set statusline+=%-10.3n\                     	" buffer number  
"set statusline+=%f\                          	" filename   
"set statusline+=%h%m%r%w                     	" status flags  
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] 	" file type  
"set statusline+=%=                           	" right align remainder  
"set statusline+=%-14(%l,%c%V%)               	" line, character
"set statusline+=%<%P                         	" file position  

" spelling
set spellfile=~/.vim/spellfile.add

"" keybindings

" auto completion with tab key
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" some bindings in normal mode
nnoremap 	+ 		:bnext <CR>
nnoremap 	- 		:bprevious <CR>
nnoremap 	, 		:
"nnoremap 	<up>	gk
"nnoremap 	<down>	gj
"inoremap 	<up>	<C-o>gk
"inoremap 	<down>	<C-o>gj
nnoremap 	<C-p>	:Mru 
nnoremap 	Q 		gqap
let g:UltiSnipsExpandTrigger = '<f5>'

"remapping arrow keys
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
