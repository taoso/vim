func! ExpandTab(len) "{{{"
	setlocal expandtab
	execute 'setlocal shiftwidth='.a:len
	execute 'setlocal softtabstop='.a:len
	execute 'setlocal tabstop='.a:len
endfunc "}}}"
autocmd FileType html,css,scss,javascript,tex call ExpandTab(2)
autocmd FileType php,python,json,nginx call ExpandTab(4)

autocmd FileType vim setlocal foldmethod=marker
autocmd FileType json setlocal foldmethod=syntax
autocmd FileType json setlocal foldlevel=1
autocmd FileType markdown setlocal wrap
autocmd BufRead composer.lock setlocal ft=json
autocmd BufRead *.phpt setlocal ft=php
autocmd BufRead *.phtml setlocal ft=html
" 将光标跳转到上次打开当前文件的位置
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif
" 清理行尾空白字符，md 文件除外
autocmd BufWritePre * :%s/\s\+$//e

