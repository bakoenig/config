"" status line

set laststatus=2                             	" always show statusbar

"the classic statusline
"
"set statusline=
"set statusline+=%-10.3n\                     	" buffer number
"set statusline+=%f\                          	" filename
"set statusline+=%h%m%r%w                     	" status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] 	" file type
"set statusline+=%=                           	" right align remainder
"set statusline+=%-14(%l,%c%V%)               	" line, character
"set statusline+=%<%P                         	" file position

"a condensed statusline
"
"let &statusline='%F  %r%m  [%{&fileformat}]%y[%{strlen(&fenc)?&fenc:&enc}]'
"           \ . '%= --%3p%% --   l:%3l, c:%3c (%03b 0x%02B)'

"airline configuration
"
"let g:airline_theme="murmur"
let g:airline_theme             = 'powerlineish'
"let g:airline_powerline_fonts 	= 1
let g:airline_enable_branch     = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_warning=''
