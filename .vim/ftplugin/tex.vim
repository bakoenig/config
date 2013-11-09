"setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
"setlocal makeprg=rubber \ \-file\-line\-error\ \-interaction=nonstopmode

"settings for vim-latexsuite
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'rubber --pdf'
let g:Tex_ViewRule_dvi = 'evince'
let g:Tfx_ViewRule_pdf = 'evince'
map <f2> :w<cr><leader>ll
imap <f2> <esc>:w<cr><leader>ll

"these bindings make typing easier on german keyboard
inoremap ß \
inoremap ö {
inoremap ä }
