call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Townk/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/matchit.zip'

Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'phpvim/phpcd.vim', { 'for': 'php' }
Plug 'phpvim/phpfold.vim', { 'for': 'php' }
Plug 'vim-php/tagbar-phpctags.vim', { 'for': 'php' }
Plug 'vim-scripts/progressbar-widget', { 'for': 'php' }
Plug 'xsbeats/vim-blade'
Plug 'justmao945/vim-clang'

Plug 'hynek/vim-python-pep8-indent'

Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'wavded/vim-stylus'

Plug 'plasticboy/vim-markdown'
call plug#end()

filetype plugin indent on
syntax on
color molokai
set colorcolumn=80
set cursorline
set linebreak
set list
set fileformat=unix
set fileencodings=utf-8,gbk
set nospell
set noswapfile
set nobackup
set ignorecase
set smartcase
set smartindent
set pastetoggle=<leader>v
set mouse-=a
" clear search highlight by type enter
nnoremap <CR> :noh<CR><CR>

func! ExpandTab(len)
	setlocal expandtab
	execute 'setlocal shiftwidth='.a:len
	execute 'setlocal softtabstop='.a:len
	execute 'setlocal tabstop='.a:len
endfunc
autocmd FileType html,css,scss,javascript call ExpandTab(2)
autocmd FileType php,python,json,nginx call ExpandTab(4)

autocmd FileType vim setlocal foldmethod=marker
" 将光标跳转到上次打开当前文件的位置 {{{
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif " }}}
" 清理行尾空白字符，md 文件除外 {{{
autocmd BufWritePre * if &filetype != 'markdown' |
			\ :%s/\s\+$//e |
			\ endif " }}}

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>

" NERD Tree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
" 所有编辑窗口关闭后自动关闭 NERDTree
autocmd bufenter * if (winnr("$") == 1 && &filetype == 'nerdtree') | q | endif

" PHPCD
autocmd CompleteDone * pclose " 补全完成后自动关闭预览窗口
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
autocmd FileType php setlocal iskeyword-=$

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

autocmd FileType c,cpp setlocal foldmethod=syntax

let g:deoplete#enable_at_startup = 1

let g:ackprg = 'ag --vimgrep'

" fzf {{{
rsh
if !exists('LV_MRU_LIST_JSON')
	let LV_MRU_LIST_JSON = '[]'
endif
let g:lv_mru_list = json_decode(LV_MRU_LIST_JSON)

nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-u> :call ListMruFile()<CR>


function! ListMruFile()
	let files = map(copy(g:lv_mru_list), 'fnamemodify(v:val, ":~:.")')
	let file_len = len(files)
	if file_len == 0
		return
	elseif file_len > 10
		let file_len = 10
	endif
	let file_len = file_len + 2
	call fzf#run({
			\ 'source': files,
			\ 'sink': 'edit',
			\ 'options': '-m -x +s',
			\ 'down': file_len})
endfunction

function! s:RecordMruFile()
	let cpath = expand('%:p')
	if !filereadable(cpath)
		return
	endif
	if cpath =~ 'fugitive'
		return
	endif
	let idx = index(g:lv_mru_list, cpath)
	if idx >= 0
		call filter(g:lv_mru_list, 'v:val !=# cpath')
	endif
	if cpath != ''
		call insert(g:lv_mru_list, cpath)
	endif
endfunction

function! s:ClearCurretnFile()
	let cpath = expand('%:p')
	let idx = index(g:lv_mru_list, cpath)
	if idx >= 0
		call remove(g:lv_mru_list, idx)
	end
endfunction

autocmd BufEnter * call s:ClearCurretnFile()
autocmd BufWinLeave,BufWritePost * call s:RecordMruFile()
autocmd VimLeavePre * let LV_MRU_LIST_JSON = json_encode(g:lv_mru_list)
" }}}
