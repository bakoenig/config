"" general settings

filetype plugin indent on
set autoindent
set nobackup
set backspace=2
set guioptions=acei

" allow changing the buffer without saving
set hidden 
set nocompatible
set autoindent
set nobackup
set noswapfile
set backspace=2
set guioptions=acei
set tabstop=4

" allow changing the buffer without saving
set hidden

" configure search
set hlsearch
set ignorecase
set smartcase
set incsearch

" switch on syntax highlighting
syntax on

" show cursor position all the time
set ruler

" wrap at word
set linebreak

" full menu
set wildmenu
set wildmode=list:longest,full
set mouse=a

" status line
set laststatus=2                             	" always show statusbar  
set statusline=  
set statusline+=%-10.3n\                     	" buffer number  
set statusline+=%f\                          	" filename   
set statusline+=%h%m%r%w                     	" status flags  
set statusline+=\[%{strlen(&ft)?&ft:'none'}] 	" file type  
set statusline+=%=                           	" right align remainder  
set statusline+=%-14(%l,%c%V%)               	" line, character
set statusline+=%<%P                         	" file position  

" spelling
set spellfile=~/.vim/spellfile.add

"" new keybindings

"cycle buffers in normal mode
nnoremap + :bnext <CR>
nnoremap - :bprevious <CR>

" reflow
nnoremap Q gqap

" tab auto completion
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

"" different themes

"colors xemacs
"colors Mustang
colors biogoo

" some small bindings in normal mode
nnoremap + :bnext <CR>
nnoremap - :bprevious <CR>
nnoremap , :
"reflow
nnoremap Q gqap
" easy access to extensions
cabbrev mru Mru
cabbrev be BufExplorerHorizontalSplit

" tab auto completion
function! Tab_Or_Complete()
if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
return "\<C-N>"
else
return "\<Tab>"
endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

"" latex-suite

let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex'
let g:Tex_ViewRule_dvi = 'evince'
let g:Tfx_ViewRule_pdf = 'evince'

"" different themes

"colors asu1dark
<<<<<<< HEAD
colors biogoo
"colors navajo-night
=======
"colors biogoo
colors navajo-night
>>>>>>> a86c250f31515b23ba2af59cc6af52b3a0145d4f
