" Tagbar {{{
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_sort = 0
"{{{
let g:tagbar_type_php = {
	\ 'ctagsbin'  : 'phpctags',
	\ 'ctagsargs' : '-f -',
	\ 'kinds'     : [
		\ 'd:Constants:0:0',
		\ 'v:Variables:0:0',
		\ 'f:Functions:1',
		\ 'i:Interfaces:0',
		\ 'c:Classes:0',
		\ 'p:Properties:0:0',
		\ 'm:Methods:1',
		\ 'n:Namespaces:0',
		\ 't:Traits:0',
	\ ],
	\ 'sro'        : '::',
	\ 'kind2scope' : {
		\ 'c' : 'class',
		\ 'm' : 'method',
		\ 'f' : 'function',
		\ 'i' : 'interface',
		\ 'n' : 'namespace',
		\ 't' : 'trait',
	\ },
	\ 'scope2kind' : {
		\ 'class'     : 'c',
		\ 'method'    : 'm',
		\ 'function'  : 'f',
		\ 'interface' : 'i',
		\ 'namespace' : 'n',
		\ 'trait'     : 't',
	\ }
\ }
"}}}
" }}}

" NERD Tree {{{
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" }}}

" ack {{{
let g:ackprg = 'ag --vimgrep --ignore tags'
" }}}

" fzf {{{
function! s:FindRoot() " {{{
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

	let g:fzf_root = root
	return root
endfunction " }}}
execute "nnoremap <silent> <C-p> :FZF ".s:FindRoot()."<CR>"
nnoremap <silent> <C-u> :FZFMru<CR>
let g:fzf_mru_file_list_size = 100
" }}}

" ale {{{
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1
" }}}

" vimwiki {{{
let g:vimwiki_list = [{'path': '~/Nutstore/notes/me'},
			\{'path': '~/Nutstore/notes/bili'}]
" }}}

" neosnippet {{{
let g:neosnippet#enable_completed_snippet = 1
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" }}}

" go {{{
autocmd FileType go nnoremap <buffer> <silent> <C-]> :GoDef<CR>
autocmd FileType go nnoremap <buffer> <silent> <K> :GoDoc<CR>
autocmd FileType go setlocal foldmethod=syntax
" }}}

command! DiffSaved vert new | set bt=nofile | r # | 0d_ | diffthis
			\ | wincmd p | diffthis
