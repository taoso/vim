function! vim#Jump()
	setlocal iskeyword+=:
	let cword = expand('<cword>')
	setlocal iskeyword-=:

	let flags = 'wes'
	if stridx(cword, '#') >= 0 && cword[len(cword)-1] != '#'
		let parts = split(cword, '#')

		call remove(parts, -1)
		let fpath = join(parts, '/').'.vim'

		let vim_jump_paths = get(g:, 'vim_jump_paths', '')
		let paths = split(vim_jump_paths, ',') + split(&runtimepath, ',')

		for root in paths
			let p = root . '/autoload/' . fpath

			if !filereadable(p)
				continue
			endif

			execute 'e ' . p
			let flags = 'we'
		endfor
	endif

	let pattern = "\\vfu(nction)?!? ".cword
	call search(pattern, flags)
endfunction
