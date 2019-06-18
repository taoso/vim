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

function! lv#Term()
	if &buftype == "terminal"
		execute 'keepalt vertical split'
		execute 'wincmd w'
	else
		execute 'keepalt belowright new'
	end
	if has('nvim')
		execute 'terminal'
		startinsert
	else
		execute 'terminal ++curwin'
	end
endfunction
