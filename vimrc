" preparation for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/a.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'marijnh/tern_for_vim'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/DrawIt'
Bundle 'plasticboy/vim-markdown'
Bundle 'godlygeek/tabular'

set background=dark

set fencs=utf-8,gb2312,gbk  " Sets the default encoding
filetype plugin indent on   " Automatically detect file types
syntax on                   " Syntax highlighting
"set autochdir               " Always switch to the current file directory
set fileformat=unix

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
set softtabstop=4           " let backspace delete indent
set tabstop=4               " An indentation every four columns
set colorcolumn=80

autocmd BufWritePre * :%s/\s\+$//e " auto clean trailing whitespace for py
autocmd FileType html,css,javascript set shiftwidth=2
autocmd FileType html,css,javascript set softtabstop=2
autocmd FileType html,css,javascript set tabstop=2

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
let g:Powerline_symbols = 'unicode'
set laststatus=2
set t_Co=256

" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.(git|hg|svn|build|)$',
            \ 'file': '\.(exe|so|dll|pyc|pdf|o)$',}
nnoremap <NL> :CtrlPMRU<CR>
nnoremap <leader>. :CtrlPTag<cr>

" YouCompleteMe
map <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0

let g:vim_markdown_folding_disabled=1
