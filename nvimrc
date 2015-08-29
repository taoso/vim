" 插件列表 " {{{
call plug#begin()

" PHP
Plug '2072/PHP-Indenting-for-VIm'
Plug 'lvht/phpfolding.vim'
Plug 'lvht/phpcd.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Go
Plug 'fatih/vim-go'

" Python
Plug 'hynek/vim-python-pep8-indent'
Plug 'Valloric/YouCompleteMe'

" 文件操作
Plug 'lvht/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" 视觉样式
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'cakebaker/scss-syntax.vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'wavded/vim-stylus'
Plug 'xsbeats/vim-blade'

" 杂项
Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/syntastic'

call plug#end() " }}}

" 基础配置 {{{
filetype plugin indent on

syntax on
color molokai
set colorcolumn=80
set cursorline
set laststatus=2
set linebreak
set list " 高亮行尾字符
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\ " 高亮显示不合理的空白字符
set scrolloff=4

set fileformat=unix
set fileencodings=utf-8,gbk

set nospell
set history=10000

set noswapfile
set nobackup

set ignorecase " 搜索内容不区分大小写
set smartcase " 搜索内容中有大写字母时则区分大小写

set autoindent " 自动缩进
set smartindent " 根据文件类型智能缩进

set pastetoggle=<leader>v " 切换粘贴模式快捷键

" 将制表符展开成特定长度的空格串
func! ExpandTab(len) " {{{
	setlocal expandtab
	execute 'setlocal shiftwidth='.a:len
	execute 'setlocal softtabstop='.a:len
	execute 'setlocal tabstop='.a:len
endfunc " }}}

autocmd FileType html,css,scss,javascript call ExpandTab(2)
autocmd FileType php,python,json,nginx call ExpandTab(4)
" vim 配置或者脚本文件使用特定标记进行折叠
autocmd FileType vim setlocal foldmethod=marker

" 将光标跳转到上次打开当前文件的位置
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif

autocmd BufWritePre * :%s/\s\+$//e " 保存文件时删除行尾空白
" }}}

" 插件配置 " {{{
" Tagbar
nnoremap <leader>t :TagbarToggle<CR> " 设置激活快捷键

" CtrlP
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pdf
let g:ctrlp_custom_ignore={
			\'dir': '(git|hg|svn)$',
			\'file': 'tags$',
			\}
let g:ctrlp_mru_custom_ignore=[
			\'/tmp/',
			\]
nnoremap <C-u> :CtrlPMRU<CR>

" NERD Tree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" 所有编辑窗口关闭后自动关闭 NERDTree
autocmd bufenter * if (winnr("$") == 1
			\&& exists("b:NERDTreeType")
			\&& b:NERDTreeType == "primary") | q | endif

" vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='luna'
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='|'

" PHPCD
autocmd CompleteDone * pclose " 补全完成后自动关闭预览窗口
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
" }}}

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
