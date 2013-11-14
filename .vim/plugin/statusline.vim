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
"let &statusline='%F  %r%m  [%{&fileformat}]%y[%{strlen(&fenc)?&fenc:&enc}]'
"\ . '%= --%3p%% --   l:%3l, c:%3c (%03b 0x%02B)'

"" jamessan's
"
"set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%m%r%w                     " flags
"set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
let g:lightline.active = {
		    \ 'left': [ [ 'mode', 'paste' ],
		    \           [ 'readonly', 'absolutepath', 'modified' ] ],
		    \ 'right': [ [ 'lineinfo' ],
		    \            [ 'percent' ],
		    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
		let g:lightline.inactive = {
		    \ 'left': [ [ 'filename' ] ],
		    \ 'right': [ [ 'lineinfo' ],
		    \            [ 'percent' ] ] }
		let g:lightline.tabline = {
		    \ 'left': [ [ 'tabs' ] ],
		    \ 'right': [ [ 'close' ] ] }

