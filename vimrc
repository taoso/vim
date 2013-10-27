set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'scrooloose/syntastic'
Bundle 'sprsquish/thrift.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'othree/html5.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'jelera/vim-javascript-syntax'

set background=dark

set fencs=utf-8,gb2312,gbk  " Sets the default encoding
filetype plugin indent on   " Automatically detect file types
syntax on                   " Syntax highlighting
set autochdir               " Always switch to the current file directory

set nospell
set history=1000

set noswapfile
set nobackup

set showmode
set cursorline
set backspace=indent,eol,start
set linespace=0
set showmatch
set incsearch               " Find as you type search
set hlsearch
set ignorecase
set smartcase               " Case sensitive when uc present
set autoread                " Auto reload file on change
set wrap                    " Wrap long lines
set lbr                     " line break
set tw=0                    " Sets the text width
set ai                      " Auto indent
set si                      " Smart indent
set expandtab               " Tabs are spaces
set shiftwidth=4            " Use indents of 4 spaces
set tabstop=4               " An indentation every four columns
set softtabstop=4           " let backspace delete indent
au BufReadPost * if 
    \ line("'\"") > 1 && line("'\"") <= line("$") 
    \ | exe "normal! g'\"" | 
    \ endif

set colorcolumn=80

autocmd BufWritePre *.py :%s/\s\+$//e " auto clean trailing whitespace

autocm FileType css,less,javascript,html set shiftwidth=2
autocm FileType css,less,javascript,html set tabstop=2
autocm FileType css,less,javascript,html set softtabstop=2

" jump to the last position when reopening a file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Color theme
color solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256

" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.(git|hg|svn|build|)$',
    \ 'file': '\.(exe|so|dll|pyc|pdf)$',}
map <Enter> :CtrlPMRU<CR>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=0
let g:syntastic_python_flake8_post_args='--ignore=W402'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration <CR>

" Thrift
autocmd BufRead,BufNewFile *.thrift set filetype=thrift

" vim-markdown
let g:vim_markdown_folding_disabled=1
