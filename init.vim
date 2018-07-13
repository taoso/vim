call plug#begin() " {{{
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jacoborus/tender.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
Plug 'lvht/fzf-mru'
Plug 'mileszs/ack.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Townk/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/matchit.zip'
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'lvht/phpfold.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'w0rp/ale'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'justinmk/vim-syntax-extra'
Plug 'wavded/vim-stylus', { 'for': 'scss' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'lvht/tagbar-markdown', { 'for': 'markdown' }
Plug 'ironhouzi/vim-stim'
Plug 'jreybert/vimagit'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'jodosha/vim-godebug', { 'for': 'go' }
Plug 'sebdah/vim-delve', { 'for':'go' }
Plug 'cespare/vim-toml'
call plug#end() " }}}

color tender
highlight Normal guibg=#000001 " 纯黑背景，酷
highlight Visual guibg=#323232 ctermbg=0
highlight Todo guifg=yellow guibg=bg gui=bold

set colorcolumn=80
set cursorline
set linebreak
set list
set fileformat=unix
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termguicolors
set noswapfile
set ignorecase
set smartcase
set smartindent
set pastetoggle=<leader>v
set conceallevel=2

nnoremap <silent> <CR> :noh<CR><CR>
func! ExpandTab(len) " {{{
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
autocmd FileType html,css,scss,javascript,tex call ExpandTab(2)
autocmd FileType php,python,json,nginx call ExpandTab(4)

autocmd FileType vim setlocal foldmethod=marker
autocmd FileType json setlocal foldmethod=syntax
autocmd FileType json setlocal foldlevel=1
autocmd FileType markdown setlocal wrap
autocmd BufRead composer.lock setlocal ft=json
autocmd BufRead *.phpt setlocal ft=php
autocmd BufRead *.phtml setlocal ft=html

" 将光标跳转到上次打开当前文件的位置 {{{
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif " }}}

autocmd FileType php highlight link phpDocTags phpDefine
autocmd FileType php highlight link phpDocParam phpType

" Tagbar {{{
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▸', '▾']
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

" go {{{
autocmd FileType go nnoremap <buffer> <silent> <C-]> :GoDef<CR>
autocmd FileType go nnoremap <buffer> <silent> <K> :GoDoc<CR>
autocmd InsertLeave,CompleteDone *.go if pumvisible() == 0 | pclose | endif
" }}}

let g:airline#extensions#whitespace#mixed_indent_algo = 1

command! DiffSaved vert new | set bt=nofile | r # | 0d_ | diffthis
			\ | wincmd p | diffthis
