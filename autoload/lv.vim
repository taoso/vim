function! lv#lastline()
	let last = line("'\"")
	let end = line("$")
	if  last > 0 && last <= end
		normal! g`"
	endif
endfunction

function! lv#expandtab(len)
	if a:len
		setlocal expandtab
		execute 'setlocal shiftwidth='.a:len
		execute 'setlocal softtabstop='.a:len
		execute 'setlocal tabstop='.a:len
	else
		setlocal noexpandtab
		execute 'setlocal shiftwidth&vim'
		execute 'setlocal softtabstop&vim'
		execute 'setlocal tabstop&vim'
	endif
endfunction

function! lv#filename(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let name = fnamemodify(bufname(buflist[winnr - 1]), ':t')
	return empty(name) ? '[No Name]' : name
endfunction

function! lv#numtab()
	let s = ''
	for i in range(tabpagenr('$'))
		let n = i + 1
		if n == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		let s .= n . ':%{lv#filename(' . n . ')} '
	endfor
	return s
endfunction

function! lv#switchabc()
	let s = system('defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources')
	let is_abc = stridx(s, '"KeyboardLayout Name" = ABC') > 0

	if !is_abc
		silent !osascript /usr/local/opt/lv/ctrl+space.scpt
	end
endfunction

function! lv#copy()
  let c = join(v:event.regcontents,"\n")
  let c64 = system("base64", c)
  let s = "\e]52;c;" . trim(c64) . "\x07"
  call chansend(v:stderr, s)
endfunction
