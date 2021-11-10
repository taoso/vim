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

function! lv#vimjump()
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
