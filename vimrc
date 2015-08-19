call plug#begin()

Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'wavded/vim-stylus'
Plug 'xsbeats/vim-blade'
Plug 'evanmiller/nginx-vim-syntax'

" 通用编程工具
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'

" PHP
Plug '2072/PHP-Indenting-for-VIm'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'lvht/phpcomplete.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Go
Plug 'fatih/vim-go'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'

" 文件操作
Plug 'lvht/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" 视觉样式
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" 其他
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/matchit.zip'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'Townk/vim-autoclose'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" 基础配置
set nocompatible
filetype plugin indent on
syntax on
" set autochdir
set tags=tags;

set fileformat=unix
set fileencodings=utf-8,gbk

set nospell
set history=10000

set noswapfile
set nobackup

set showmode
set cursorline
set backspace=indent,eol,start
set linespace=0
set showmatch

set incsearch
set hlsearch
set ignorecase
set smartcase

set autoread
set wrap
set linebreak
set textwidth=0
set colorcolumn=80
set laststatus=2
set scrolloff=4
set autoindent
set smartindent
set pastetoggle=<leader>v

set list " 高亮行尾字符
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\ " 高亮显示不合理的空白字符

func! ExpandTab(len)
	setlocal expandtab
	execute 'setlocal shiftwidth='.a:len
	execute 'setlocal softtabstop='.a:len
	execute 'setlocal tabstop='.a:len
endfunc

autocmd FileType html,css,scss,javascript call ExpandTab(2)
autocmd FileType php,python,json,nginx call ExpandTab(4)
autocmd FileType gitcommit call phpcomplete_extended#disable()

" 将光标跳转到上次打开当前文件的位置
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif

autocmd BufWritePre * :%s/\s\+$//e " 保存文件时删除行尾空白

" 插件配置
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

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

" Solarized Theme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set t_Co=256
if has('gui_running')
	set background=light
else
	set background=dark
endif
colorscheme solarized
color molokai

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='luna'
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='|'

" PHP Complete
let g:phpcomplete_index_composer_command="composer"
let g:phpcomplete_use_hhvm=1

autocmd CompleteDone * pclose " 补全完成后自动关闭预览窗口

" autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" NERDTree
" 所有编辑窗口关闭后自动关闭 NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
