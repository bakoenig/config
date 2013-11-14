"" status lines

set laststatus=2                             	" always show statusbar

"" the classic statusline
"
"set statusline=
"set statusline+=%-10.3n\                     	" buffer number
"set statusline+=%f\                          	" filename
"set statusline+=%h%m%r%w                     	" status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] 	" file type
"set statusline+=%=                           	" right align remainder
"set statusline+=%-14(%l,%c%V%)               	" line, character
"set statusline+=%<%P                         	" file position

"" a condensed statusline
"
let &statusline=' %F  %h%w%r%m  %Y [%{&fileformat}][%{strlen(&fenc)?&fenc:&enc}] %= (%l,%c) (%P) '

"" lightline config
"
"let g:lightline = {
"      \ 'colorscheme': 'jellybeans',
"      \ }
"let g:lightline.active = {
"		    \ 'left': [ [ 'mode', 'paste' ],
"		    \           [ 'readonly', 'absolutepath', 'modified' ] ],
"		    \ 'right': [ [ 'lineinfo' ],
"		    \            [ 'percent' ],
"		    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
"		let g:lightline.inactive = {
"		    \ 'left': [ [ 'filename' ] ],
"		    \ 'right': [ [ 'lineinfo' ],
"		    \            [ 'percent' ] ] }
"		let g:lightline.tabline = {
"		    \ 'left': [ [ 'tabs' ] ],
"		    \ 'right': [ [ 'close' ] ] }
