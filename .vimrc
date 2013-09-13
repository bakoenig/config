"" general settings

filetype plugin indent on
<<<<<<< HEAD
set autoindent
set nobackup
set backspace=2
set guioptions=acei

" allow changing the buffer without saving
set hidden 
=======
set nocompatible
set autoindent
set nobackup
set noswapfile
set backspace=2
set guioptions=acei
set tabstop=4

" allow changing the buffer without saving
set hidden
>>>>>>> fff2ebd7139ee5200f0027fcc22257b4e3f2d4f4

" configure search
set hlsearch
set ignorecase
<<<<<<< HEAD
=======
set smartcase
>>>>>>> fff2ebd7139ee5200f0027fcc22257b4e3f2d4f4
set incsearch

" switch on syntax highlighting
syntax on

" show cursor position all the time
set ruler

" wrap at word
<<<<<<< HEAD
set lbr
=======
set linebreak
>>>>>>> fff2ebd7139ee5200f0027fcc22257b4e3f2d4f4

" full menu
set wildmenu
set wildmode=list:longest,full
set mouse=a

" status line
<<<<<<< HEAD
set laststatus=2                             	" always show statusbar  
set statusline=  
set statusline+=%-10.3n\                     	" buffer number  
set statusline+=%f\                          	" filename   
set statusline+=%h%m%r%w                     	" status flags  
set statusline+=\[%{strlen(&ft)?&ft:'none'}] 	" file type  
set statusline+=%=                           	" right align remainder  
set statusline+=%-14(%l,%c%V%)               	" line, character
set statusline+=%<%P                         	" file position  
=======
set laststatus=2 " always show statusbar
set statusline=
set statusline+=%-10.3n\ " buffer number
set statusline+=%f\ " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%= " right align remainder
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P " file position
>>>>>>> fff2ebd7139ee5200f0027fcc22257b4e3f2d4f4

" spelling
set spellfile=~/.vim/spellfile.add

"" new keybindings

<<<<<<< HEAD
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

=======
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

>>>>>>> fff2ebd7139ee5200f0027fcc22257b4e3f2d4f4
"" latex-suite

let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex'
let g:Tex_ViewRule_dvi = 'evince'
let g:Tfx_ViewRule_pdf = 'evince'
<<<<<<< HEAD
=======

"" different themes

"colors asu1dark
"colors biogoo
colors navajo-night
>>>>>>> fff2ebd7139ee5200f0027fcc22257b4e3f2d4f4
