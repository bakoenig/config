"" status line
set laststatus=2                             	" always show statusbar
"set statusline=
"set statusline+=%-10.3n\                     	" buffer number
"set statusline+=%f\                          	" filename
"set statusline+=%h%m%r%w                     	" status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] 	" file type
"set statusline+=%=                           	" right align remainder
"set statusline+=%-14(%l,%c%V%)               	" line, character
"set statusline+=%<%P                         	" file position
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_warning=''
let g:airline_theme="murmur"
