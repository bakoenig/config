"configure make command
setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
exec "setlocal makeprg=make\\ -f\\ ~/bin/latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")

"use quickfix window
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"include :,-, and _ in tab completion
"not necessary if auctex.vim plugin is active
"
"setlocal iskeyword+=:,-,_

"some keybindings for TeXing
map <buffer> 		<f2> 		:w<cr>:make<cr><cr>
imap <buffer> 		<f2> 		<esc>:w<cr>:make<cr><cr>
nnoremap <buffer> 	<f3> 		:!evince %:r.pdf &<cr><cr>

"these bindings make tex typing easier on a german keyboard
"map! <buffer> 		ß \
"map! <buffer> 		ö {
"map! <buffer> 		ä }


"" what follows is my own extraction from the auctex.vim plugin
" 
" Tab key mapping   {{{
" In a math environment, the tab key moves between {...} braces, or to the end
" of the line or the end of the environment.  Otherwise, it does word
" completion.  But if the previous character is a blank, or if you are at the
" end of the line, you get a tab.  If the previous characters are \ref{
" then a list of \label{...} completions are displayed.  Choose one by
" clicking on it and pressing Enter.  q quits the display.  Ditto for 
" \cite{, except you get to choose from either the bibitem entries, if any,
" or the bibtex file entries.
" This was inspired by the emacs package Reftex.

inoremap <buffer><silent> <Insert> <C-R>=<SID>TexInsertTabWrapper('backward')<CR>

function! s:TexInsertTabWrapper(direction) 

    " Check to see if you're in a math environment.  Doesn't work for $$...$$.
    let line = getline('.')
    let len = strlen(line)
    let column = col('.') - 1
    let ending = strpart(line, column, len)
    let n = 0

    let dollar = 0
    while n < strlen(ending)
	if ending[n] == '$'
	    let dollar = 1 - dollar
	endif
	let n = n + 1
    endwhile

    let math = 0
    let ln = line('.')
    while ln > 1 && getline(ln) !~ '\\begin\|\\end\|\\\]\|\\\['
	let ln = ln - 1
    endwhile
    if getline(ln) =~ 'begin{\(eq\|arr\|align\|mult\)\|\\\['
	let math = 1
    endif

    " Check to see if you're between brackets in \ref{} or \cite{}.
    " Inspired by RefTex.
    " Typing q returns you to editing
    " Typing <CR> or Left-clicking takes the data into \ref{} or \cite{}.
    " Within \cite{}, you can enter a regular expression followed by <Tab>,
    " Only the citations with matching authors are shown.
    " \cite{c.*mo<Tab>} will show articles by Mueller and Moolinar, for example.
    " Once the citation is shown, you type <CR> anywhere within the citation.
    " The bibtex files listed in \bibliography{} are the ones shown.
    if strpart(line,column-5,5) == '\ref{'
	let name = bufname(1)
	let short = substitute(name, ".*/", "", "")
	"let aux = strpart(short, 0, strlen(short)-3)."aux"
	"if filereadable(aux)
	"    let tmp = tempname()
	"    execute "below split ".tmp
	"    execute "0read ".aux
	"    g!/^\\newlabel{/delete
	"    g/.*/normal 3f{lyt}0Pf}D0f\cf{       
	"    execute "write! ".tmp

	"    noremap <buffer> <LeftRelease> <LeftRelease>:call <SID>RefInsertion("aux")<CR>a
	"    noremap <buffer> <CR> :call <SID>RefInsertion("aux")<CR>a
	"    noremap <buffer> q :bwipeout!<CR>i
	"    return "\<Esc>"
	"else
	    let tmp = tempname()
	    vertical 25split
	    execute "write! ".tmp
	    execute "edit ".tmp
	    g!/\\label{/delete
	    %s/.*\\label{//e
	    %s/}.*//e
	    noremap <buffer> <LeftRelease> <LeftRelease>:call <SID>RefInsertion(0)<CR>a
	    noremap <buffer> <CR> :call <SID>RefInsertion(0)<CR>a
	    noremap <buffer> q :bwipeout!<CR>i
	    return "\<Esc>"
	"endif
    elseif strpart(line,column-6,6) == '\cite{'
	let tmp = tempname()
        execute "write! ".tmp
        execute "split ".tmp

"	if 0 != search('\\begin{thebibliography}')
"	    bwipeout!
"	    execute "below split ".tmp
"	    call search('\\begin{thebibliography}')
"	    normal kdgg
"	    noremap <buffer> <LeftRelease> <LeftRelease>:call <SID>CiteInsertion('\\bibitem')<CR>a
"	    vnoremap <buffer> <RightRelease> <C-c><Left>:call <SID>CommaCiteInsertion('\\bibitem')<CR>
"	    noremap <buffer> <CR> :call <SID>CiteInsertion('\\bibitem')<CR>a
"	    noremap <buffer> , :call <SID>CommaCiteInsertion('\\bibitem')<CR>
"	    noremap <buffer> q :bwipeout!<CR>f}i
"	    return "\<Esc>"
"	else
	    let l = search('\\bibliography{')
	    bwipeout!
	    if l == 0
		return ''
	    else
		let s = getline(l)
		let beginning = matchend(s, '\\bibliography{')
		let ending = matchend(s, '}', beginning)
		let f = strpart(s, beginning, ending-beginning-1)
		let tmp = tempname()
		execute "below split ".tmp
		let file_exists = 0

		let name = bufname(1)
		let base = substitute(name, "[^/]*$", "", "")
		while f != ''
		    let comma = match(f, ',[^,]*$')
		    if comma == -1
			let file = base.f.'.bib'
			if filereadable(file)
			    let file_exists = 1
			    execute "0r ".file
			endif
			let f = ''
		    else
			let file = strpart(f, comma+1)
			let file = base.file.'.bib'
			if filereadable(file)
			    let file_exists = 1
			    execute "0r ".file
			endif
			let f = strpart(f, 0, comma)
		    endif
		endwhile

		noremap <buffer> <LeftRelease> <LeftRelease>:call <SID>CiteInsertion("@")<CR>a
"		vnoremap <buffer> <RightRelease> <C-c><Left>:call <SID>CommaCiteInsertion("@")<CR>
		noremap <buffer> <CR> :call <SID>CiteInsertion("@")<CR>a
"		noremap <buffer> , :call <SID>CommaCiteInsertion("@")<CR>
		noremap <buffer> q :bwipeout!<CR>i
		return "\<Esc>"

	    endif
	endif
    if dollar == 1   " If you're in a $..$ environment
    if ending[0] =~ ')\|]\||'
        return "\<Right>"
    elseif ending =~ '^\\}\|\\|'
        return "\<Right>\<Right>"
    elseif ending =~ '^\\right\\'
        return "\<Esc>8la"
    elseif ending =~ '^\\right'
        return "\<Esc>7la"
    elseif ending =~ '^}\(\^\|_\|\){'
        return "\<Esc>f{a"
    elseif ending[0] == '}'
        return "\<Right>"
    else
        return "\<Esc>f$a"
    end
    "return "\<Esc>f$a"
    elseif math == 1    " If you're in a regular math environment.
    if ending =~ '^\s*&'
        return "\<Esc>f&a"
        elseif ending[0] =~ ')\|]\||'
        return "\<Right>"
    elseif ending =~ '^\\}\|\\|'
        return "\<Right>\<Right>"
    elseif ending =~ '^\\right\\'
        return "\<Esc>8la"
    elseif ending =~ '^\\right'
        return "\<Esc>7la"
    elseif ending =~ '^}\(\^\|_\|\){'
        return "\<Esc>f{a"
    elseif ending[0] == '}'
        if line =~ '\\label'
    	return "\<Down>"
        else
    	return "\<Esc>f}a"
        endif
    elseif column == len    "You are at the end of the line.
        call search("\\\\end\\|\\\\]")
        return "\<Esc>o"
    else
        return "\<C-O>$"
    endif
    else   " If you're not in a math environment.
    " Thanks to Benoit Cerrina (modified)
    if ending[0] =~ ')\|}'  " Go past right parentheses.
        return "\<Right>"
    "elseif !column || line[column - 1] !~ '\k' 
    "    return "\<Tab>" 
    "elseif a:direction == 'backward'
    "    return "\<C-P>" 
    else 
        return "\<Esc>" 
    endif 

    endif
endfunction 


" Inspired by RefTex
function! s:RefInsertion(x)
"    if a:x == "aux"
"	normal 0Wy$
"   else
	normal 0y$
"    endif
    bwipeout!
    let thisline = getline('.')
    let thiscol  = col('.')
    if thisline[thiscol-1] == '{'
	normal p
    else
	normal P
	if thisline[thiscol-1] == '}'
	    normal l
	    if thisline[thiscol] == ')'
		normal l
	    endif
	endif
    endif
endfunction

" Inspired by RefTex
" Get one citation from the .bib file or from the bibitem entries.
function! s:CiteInsertion(x)
    +
    "if search('@','b') != 0
    if search(a:x, 'b') != 0
	if a:x == "@"
	    normal f{lyt,
	else
	    normal f{lyt}
	endif
        bwipeout!
	normal Pf}
    else
        bwipeout!
    endif
endfunction

" Inspired by RefTex
" Get one citation from the .bib file or from the bibitem entries
" and be ready to get more.
"function! s:CommaCiteInsertion(x)
"    +
"    if search(a:x, 'b') != 0
"	if a:x == "@"
"	    normal f{lyt,
"	else
"	    normal f{lyt}
"	endif
"	normal Pa,f}
"    else
"        bwipeout!
"    endif
"endfunction


" Typing __ results in _{}
function! s:SubBracket()
    let insert = '_'
    let left = getline('.')[col('.')-2]
    if left == '_'
	let insert = "{}\<Left>"
    endif
    return insert
endfunction
inoremap <buffer><silent> _ <C-R>=<SID>SubBracket()<CR>

" Typing ^^ results in ^{}
function! s:SuperBracket()
    let insert = '^'
    let left = getline('.')[col('.')-2]
    if left == '^'
	let insert = "{}\<Left>"
    endif
    return insert
endfunction
inoremap <buffer><silent> ^ <C-R>=<SID>SuperBracket()<CR>

" Key Bindings                {{{

" Typing the symbol a second time (for example, $$) will result in one
" of the symbols (for instance, $).  With {, typing \{ will result in \{\}.
inoremap <buffer><silent> ( <C-R>=<SID>Double('(',')')<CR>
"inoremap <buffer><silent> [ <C-R>=<SID>Double('[',']')<CR>
inoremap <buffer><silent> [ <C-R>=<SID>CompleteSlash('[',']')<CR>
inoremap <buffer><silent> $ <C-R>=<SID>Double('$','$')<CR>
inoremap <buffer><silent> { <C-R>=<SID>CompleteSlash('{','}')<CR>
inoremap <buffer><silent> \| <C-R>=<SID>CompleteSlash("\|","\|")<CR>

" Functions         {{{

" For () and $$
function! s:Double(left,right)
    if strpart(getline('.'),col('.')-2,2) == a:left . a:right
	return "\<Del>"
    else
	return a:left . a:right . "\<Left>"
    endif
endfunction

" Complete [, \[, {, \{, |, \|
function! s:CompleteSlash(left,right)
    let column = col('.')
    let first = getline('.')[column-2]
    let second = getline('.')[column-1]
    if first == "\\"
	if a:left == '['
	    return "\[\<CR>\<CR>\\]\<Up>"
	else
	    return a:left . "\\" . a:right . "\<Left>\<Left>"
	endif
    else
	if a:left =~ '\[\|{'
	\ && strpart(getline('.'),col('.')-2,2) == a:left . a:right
	    return "\<Del>"
        else
            return a:left . a:right . "\<Left>"
	endif
    endif
endfunction
