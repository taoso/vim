function! lv#ExpandTab(len)
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

function CloseTerm(...)
	silent close
endfunction

function! lv#Term()
	tabedit
	if has('nvim')
		let options = {'on_exit': 'CloseTerm'}
		call termopen($SHELL, options)
		startinsert
	else
		terminal ++curwin
	end
endfunction

function! lv#MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let name = fnamemodify(bufname(buflist[winnr - 1]), ':t')
	return empty(name) ? '[No Name]' : name
endfunction

function! lv#MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		let s .= ' '. (i+1) . ' '
		let s .= ' %{lv#MyTabLabel(' . (i + 1) . ')} '
	endfor
	return s
endfunction
