" preparation for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/DrawIt'
Plugin 'wavded/vim-stylus'
Plugin 'xsbeats/vim-blade'
Plugin 'pangloss/vim-javascript'
Plugin 'davidhalter/jedi-vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

call vundle#end()

set fencs=utf-8,gb2312,gbk  " Sets the default encoding
filetype plugin indent on   " Automatically detect file types
syntax on                   " Syntax highlighting
set autochdir               " Always switch to the current file directory
set tags=tags;
set fileformat=unix

set nospell
set history=10000

set noswapfile
set nobackup

set showmode
set cursorline
set backspace=indent,eol,start
set linespace=0
set showmatch
set incsearch         " Find as you type search
set hlsearch
set ignorecase
set smartcase         " Case sensitive when uc present
set autoread          " Auto reload file on change
set wrap              " Wrap long lines
set lbr               " line break
set tw=0              " Sets the text width
set ai                " Auto indent
set si                " Smart indent
set expandtab         " Tabs are spaces
set shiftwidth=4      " Use indents of 4 spaces
set softtabstop=4     " let backspace delete indent
set tabstop=4         " An indentation every four columns
set colorcolumn=80
set laststatus=2      " always show statusline
"set clipboard=unnamed " use system clipboard
set scrolloff=4
set list                                         " Show trailing whitespace
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\  " Highlight problematic whitespace

autocmd BufWritePre * :%s/\s\+$//e " auto clean trailing whitespace for py

autocmd BufRead,BufNewFile *.phtml setlocal filetype=html
autocmd BufRead,BufNewFile *.blade.php setlocal filetype=html
autocmd FileType yaml setlocal indentexpr=

" jump to the last position when reopening a file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

set background=dark
color solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set term=builtin_xterm     " Make terminal stuff works
set t_Co=256

set guifont=Inconsolata\ for\ Powerline:h18

" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pdf

let g:ctrlp_custom_ignore = {
  \ 'dir':  '(git|hg|svn)$',
  \ 'file': 'tags$',
  \ }
nnoremap <C-U> :CtrlPMRU<CR>

" YouCompleteMe
map <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0

autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

set pastetoggle=<leader>v

nnoremap <leader>t :TagbarToggle<CR>

let g:vim_markdown_folding_disabled=1

let g:netrw_liststyle=3

nnoremap <leader>e :NERDTreeToggle<CR>

" Use powerline patched fonts
let g:airline_powerline_fonts = 1
" automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
" theme airline
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
    let g:neocomplete#force_omni_input_patterns.python = '[^. \t]\.\w*'
endif

