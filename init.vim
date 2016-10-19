call plug#begin() " {{{
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jacoborus/tender.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'lvht/fzf-mru'|Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Townk/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/matchit.zip'

Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'phpvim/phpcd.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'phpvim/phpfold.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'vim-php/tagbar-phpctags.vim', { 'for': 'php' }
Plug 'vim-scripts/progressbar-widget', { 'for': 'php' }
Plug 'xsbeats/vim-blade'
Plug 'justmao945/vim-clang'

Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'justmao945/vim-clang', { 'for': ['c', 'cpp'] }

Plug 'justinmk/vim-syntax-extra'

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
call plug#end() " }}}

color tender
highlight Normal guibg=#000001 ctermbg=black " 纯黑背景，酷
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
autocmd BufRead composer.lock setlocal ft=json
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

" NERD Tree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>

" PHPCD
autocmd CompleteDone * pclose " 补全完成后自动关闭预览窗口
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
autocmd FileType php setlocal iskeyword-=$

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

let g:deoplete#enable_at_startup = 1

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

let g:lightline = { 'colorscheme': 'tender' }
