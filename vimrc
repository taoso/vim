" 启用 Vundle 插件
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'wavded/vim-stylus'
Plugin 'xsbeats/vim-blade'

" 通用编程工具
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'

" PHP
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'rayburgemeestre/phpfolding.vim'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'
Plugin 'lvht/phpcomplete-extended'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

" Go
Plugin 'fatih/vim-go'

" Python
Plugin 'davidhalter/jedi-vim'
Plugin 'hynek/vim-python-pep8-indent'

" 文件操作
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" 视觉样式
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

" 其他
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/matchit.zip'
Plugin 'yuratomo/w3m.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'

call vundle#end()

" 基础配置
filetype plugin indent on
syntax on
set autochdir
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
set mouse=v
set colorcolumn=80
set laststatus=2
set scrolloff=4
set autoindent
set smartindent
set pastetoggle=<leader>v

set list " 高亮行尾字符
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\ " 高亮显示不合理的空白字符

func ExpandTab(len)
	setlocal expandtab
	execute 'setlocal shiftwidth='.a:len
	execute 'setlocal softtabstop='.a:len
	execute 'setlocal tabstop='.a:len
endfunc

autocmd FileType html,css,scss,javascript call ExpandTab(2)
autocmd FileType php,python call ExpandTab(4)

" 将光标跳转到上次打开当前文件的位置
autocmd BufReadPost *
			\if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute "normal! g`\"" |
			\ endif
autocmd BufWritePre * :%s/\s\+$//e " 保存文件时删除行尾空白

" 插件配置
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

" CtrlP
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pdf
let g:ctrl_custom_ignore={
			\'dir': '(git|hg|svn)$',
			\'file': 'tags$',
			\}
nnoremap <C-U> :CtrlPMRU<CR>

" NERD Tree
nnoremap <leader>e :NERDTreeToggle<CR>

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

" Airline
let g:airline_powerline_fonts=1

" PHP Complete
let g:phpcomplete_index_composer_command="composer"
let g:phpcomplete_use_hhvm=1

autocmd CompleteDone * pclose " 补全完成后自动关闭预览窗口

let g:SuperTabDefaultCompletionType="<c-x><c-o>"
