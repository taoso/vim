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

func! s:savePos() " {{{
	let cur_pos = getcurpos()
	let cur_pos[0] = bufnr('%')
	let s:lv_viml_jump_stack = get(s:, 'lv_viml_jump_stack', [])
	call add(s:lv_viml_jump_stack, cur_pos)
endfunc " }}}

func! lv#VimGoTo() "{{{
	let cw = expand('<cword>')

	let parts = split(cw, '#')
	if len(parts) == 1
		call s:savePos()
		call search('func.*'.cw)
		normal zv
		return
	endif

	let paths = split(&runtimepath, ',')
	for p in paths
		let f = p.'/autoload/'.join(parts[0:-2],'/').'.vim'
		if filereadable(f)
			call s:savePos()
			execute 'e '.f
			call search('func.*'.cw)
			normal zv
			return
		endif
	endfor
endfunc "}}}

func! lv#VimBack() "{{{
	let s:lv_viml_jump_stack = get(s:, 'lv_viml_jump_stack', [])

	if len(s:lv_viml_jump_stack) == 0
		return
	endif

	let prev_pos = s:lv_viml_jump_stack[-1]
	let prev_buf = prev_pos[0]
	let prev_pos[0] = 0
	unlet s:lv_viml_jump_stack[-1]
	exec 'buffer '.prev_buf
	call setpos('.', prev_pos)
	normal zv
endfunc "}}}
