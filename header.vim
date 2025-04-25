" **************************************************************************** "
"                                                                              "
"    header.vim                                                                "
"                                                                              "
"    By: romanmikh <roman.mikhaylenko14@gmail.com>                             "
"                                                                              "
"    Created: 2025/04/25 23:09:02 by romanmikh                                 "
"    Updated: 2025/04/25 23:09:07 by romanmikh                                 "
"                                                                              "
" **************************************************************************** "

let s:start		= '/*'
let s:end		= '*/'
let s:fill		= '*'
let s:length	= 80
let s:margin	= 5

s:types		= {
			\'\.c$\|\.h$\|\.cc$\|\.hh$\|\.cpp$\|\.hpp$\|\.tpp$\|\.php\|\.glsl':
			\['/*', '*/', '*'],
			\'\.htm$\|\.html$\|\.xml$':
			\['<!--', '-->', '*'],
			\'\.js$':
			\['//', '//', '*'],
			\'\.tex$':
			\['%', '%', '*'],
			\'\.ml$\|\.mli$\|\.mll$\|\.mly$':
			\['(*', '*)', '*'],
			\'\.vim$\|\vimrc$':
			\['"', '"', '*'],
			\'\.el$\|\emacs$':
			\[';', ';', '*'],
			\'\.f90$\|\.f95$\|\.f03$\|\.f$\|\.for$':
			\['!', '!', '/']
			\}

function! s:filetype()
	let l:f = s:filename()

	let s:start	= '#'
	let s:end	= '#'
	let s:fill	= '*'

	for type in keys(s:types)
		if l:f =~ type
			let s:start	= s:types[type][0]
			let s:end	= s:types[type][1]
			let s:fill	= s:types[type][2]
		endif
	endfor

endfunction

function! s:textline(left, right)
	let l:left = strpart(a:left, 0, s:length - s:margin * 3 - strlen(a:right) + 1)

	return s:start . repeat(' ', s:margin - strlen(s:start)) . l:left . repeat(' ', s:length - s:margin * 2 - strlen(l:left) - strlen(a:right)) . a:right . repeat(' ', s:margin - strlen(s:end)) . s:end
endfunction

function! s:line(n)
	if a:n == 1 || a:n == 10 " top and bottom line
		return s:start . ' ' . repeat(s:fill, s:length - strlen(s:start) - strlen(s:end) - 2) . ' ' . s:end
	elseif a:n == 9 || a:n == 2 || a:n == 4 || a:n == 6" blank line
		return s:textline('', '')
	elseif a:n == 3 " filename
		return s:textline(s:filename(), "")
	elseif a:n == 5 " author
		return s:textline("By: " . s:user() . " <" . s:mail() . ">", "")
	elseif a:n == 7 " created
		return s:textline("Created: " . s:date() . " by " . s:user(), "")
	elseif a:n == 8 " updated
		return s:textline("Updated: " . s:date() . " by " . s:user(), "")
	endif
endfunction

function! s:user()
	let l:user = $HEADERUSER
	if strlen(l:user) == 0
		let l:user = "user"
	endif
	return l:user
endfunction

function! s:mail()
	let l:mail = $HEADEREMAIL
	if strlen(l:mail) == 0
		let l:mail = "user@example.com"
	endif
	return l:mail
endfunction

function! s:filename()
	let l:filename = expand("%:t")
	if strlen(l:filename) == 0
		let l:filename = "<unnamed_file>"
	endif
	return l:filename
endfunction

function! s:date()
	return strftime("%Y/%m/%d %H:%M:%S")
endfunction

function! s:insert()
	let l:line = 10

	" empty line after header
	call append(0, "")

	" loop over lines
	while l:line > 0
		call append(0, s:line(l:line))
		let l:line = l:line - 1
	endwhile
endfunction

function! s:update()
	call s:filetype()
	if getline(8) =~ s:start . repeat(' ', s:margin - strlen(s:start)) . "Updated: "
		if &mod
			call setline(8, s:line(8))
		endif
		call setline(3, s:line(3))
		return 0
	endif
	return 1
endfunction

function! s:header()
	if s:update()
		call s:insert()
	endif
endfunction

" Bind command and shortcut
command! Header call s:header ()
nmap <f1> <esc>:header<CR>
autocmd BufWritePre * call s:update ()
