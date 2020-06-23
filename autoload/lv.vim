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
