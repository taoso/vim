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

func ExitTerm(...)
	bdelete!
endfunc

func lv#Term()
	tabnew
	if has('nvim')
		let options = {'on_exit': 'ExitTerm'}
		call termopen($SHELL, options)
		startinsert
	else
		terminal ++curwin
	endif
endfunc

