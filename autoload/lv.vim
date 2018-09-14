func! lv#ExpandTab(len) " {{{
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
endfunc " }}}

function! lv#FindRoot() " {{{
	let pwd = expand("%:p:h")
	let root = pwd

	while root != "/"
		if (isdirectory(root.'/.git'))
			break
		endif
		if (filereadable(root.'/composer.json'))
			break
		endif
		if (filereadable(root.'/configure'))
			break
		endif
		if (isdirectory(root.'/.svn'))
			break
		endif
		if (isdirectory(root.'/.hg'))
			break
		endif
		let root = fnamemodify(root, ":h")
	endwhile

	return root
endfunction " }}}
