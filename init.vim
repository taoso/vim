call plug#begin() " {{{
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jacoborus/tender.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lvht/fzf-mru'|Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Townk/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/syntastic'

Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'phpvim/phpcd.vim', { 'do': 'composer update' }
Plug 'phpvim/phpfold.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'xsbeats/vim-blade'

Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

Plug 'justinmk/vim-syntax-extra'
Plug 'elzr/vim-json'

Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'wavded/vim-stylus'

Plug 'plasticboy/vim-markdown'
Plug 'lvht/tagbar-markdown'
Plug 'easymotion/vim-easymotion'
Plug 'ironhouzi/vim-stim'
call plug#end() " }}}

color tender
highlight Normal guibg=#000001 " 纯黑背景，酷
highlight Comment cterm=italic gui=italic
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
set mouse-=a
set nowrap
set sidescroll=1
" clear search highlight by type enter
nnoremap <silent> <CR> :noh<CR><CR>

func! ExpandTab(len) "{{{"
	setlocal expandtab
	execute 'setlocal shiftwidth='.a:len
	execute 'setlocal softtabstop='.a:len
	execute 'setlocal tabstop='.a:len
endfunc "}}}"
autocmd FileType html,css,scss,javascript call ExpandTab(2)
autocmd FileType php,python,json,nginx call ExpandTab(4)

autocmd FileType vim setlocal foldmethod=marker
autocmd FileType json setlocal foldmethod=syntax
autocmd FileType json setlocal foldlevel=1
autocmd BufRead composer.lock setlocal ft=json
autocmd BufRead *.phpt setlocal ft=php
autocmd BufRead *.phtml setlocal ft=html
" 将光标跳转到上次打开当前文件的位置 {{{
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif " }}}
" 清理行尾空白字符，md 文件除外 {{{
autocmd BufWritePre * if &filetype != 'markdown' |
			\ :%s/\s\+$//e |
			\ endif " }}}

" Tagbar
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

" NERD Tree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#sources = { '_': ['buffer', 'file'] }

let g:ackprg = 'ag --vimgrep'

nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-u> :FZFMru<CR>

" bison {{{
function! GoToYaccRule()
	let name = expand('<cword>')
	let pattern = "^".name.":"
	call search(pattern, "swp")
endfunction
autocmd FileType yacc nnoremap <C-]> :call GoToYaccRule()<CR>
" }}}

let g:fzf_mru_file_list_size = 100

let g:airline_powerline_fonts = 1
let g:airline_theme = 'tender'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
