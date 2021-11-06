function! lv#Lastline()
	let last = line("'\"")
	let end = line("$")
	if  last > 0 && last <= end
		normal! g`"
	endif
endfunction

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

		let s .= (i+1) . ':'
		let s .= ' %{lv#MyTabLabel(' . (i + 1) . ')} '
	endfor
	return s
endfunction

let g:lv_restore_last_im = 0

function! lv#AutoIM(event)
	let is_abc = system('is_abc') != ''

	let need_switch_im = 0
	if a:event == 'leave'
		if !is_abc
			let g:lv_restore_last_im = 1
			let need_switch_im = 1
		else
			let g:lv_restore_last_im = 0
		end
	else " a:event == 'enter'
		if is_abc && g:lv_restore_last_im
			let need_switch_im = 1
		end
	end

	if need_switch_im 
		silent !osascript /usr/local/opt/lv/ctrl+space.scpt
	end
endfunction

function! lv#Copy()
  let c = join(v:event.regcontents,"\n")
  let c64 = system("base64", c)
  let s = "\e]52;c;" . trim(c64) . "\x07"
  call chansend(v:stderr, s)
endfunction
