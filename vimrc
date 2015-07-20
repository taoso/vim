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
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'rayburgemeestre/phpfolding.vim'

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
Plugin 'Shougo/neocomplete.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/matchit.zip'
Plugin 'yuratomo/w3m.vim'
Plugin 'airblade/vim-gitgutter'

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
let g:airline_powerline_fonts = 1

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:gitgutter_max_signs = 500 " default value
