call plug#begin()
Plug '2072/PHP-Indenting-for-VIm'
Plug 'phpvim/phpfolding.vim'
Plug 'phpvim/phpcd.vim', { 'for': 'php' , 'do': 'composer update'}
Plug 'majutsushi/tagbar' | Plug 'vim-php/tagbar-phpctags.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'justmao945/vim-clang'
Plug 'Shougo/deoplete.nvim'
Plug 'lvht/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'wavded/vim-stylus'
Plug 'xsbeats/vim-blade'
Plug 'vim-scripts/progressbar-widget'
Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'itchyny/calendar.vim'
Plug 'fatih/vim-go'
Plug 'ternjs/tern_for_vim'
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

" 折行配置 {{{
func! ExpandTab(len)
	setlocal expandtab
	execute 'setlocal shiftwidth='.a:len
	execute 'setlocal softtabstop='.a:len
	execute 'setlocal tabstop='.a:len
endfunc
autocmd FileType html,css,scss,javascript call ExpandTab(2)
autocmd FileType php,python,json,nginx call ExpandTab(4)
" vim 配置或者脚本文件使用特定标记进行折叠
autocmd FileType vim setlocal foldmethod=marker " }}}
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
nnoremap <silent> <leader>t :TagbarToggle<CR> " 设置激活快捷键

" CtrlP
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pdf
let g:ctrlp_custom_ignore={
			\'dir': '(git|hg|svn)$',
			\'file': 'tags$',
			\}
let g:ctrlp_max_files = 0
let g:ctrlp_mruf_exclude='fugitive'
nnoremap <silent> <C-u> :CtrlPMRU<CR>

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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Calendar
let g:calendar_first_day="monday"

" Deoplete
let g:deoplete#enable_at_startup = 1

" Tern
autocmd FileType javascript nnoremap <silent> <buffer> <C-]> :TernDef<CR>
autocmd FileType javascript nnoremap <silent> <buffer> K :TernDoc<CR>

" Go
autocmd FileType go nnoremap <silent> <buffer> <C-]> :GoDef<CR>
autocmd FileType go nnoremap <buffer> K :GoDoc<CR>
