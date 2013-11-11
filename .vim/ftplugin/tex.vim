"configure make command
setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
exec "setlocal makeprg=make\\ -f\\ ~/bin/latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")

"use quickfix window
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"some keybindings
map <f2> 		:w<cr>:make<cr><cr>
imap <f2> 		<esc>:w<cr>:make<cr><cr>
nnoremap <f3> 	:!evince %:r.pdf &<CR><CR>

"these bindings make typing easier on german keyboard
inoremap ß \
inoremap ö {
inoremap ä }
