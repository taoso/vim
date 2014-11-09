" preparation for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'wavded/vim-stylus'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/DrawIt'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomtom/tcomment_vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'majutsushi/tagbar'

set background=dark

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
autocmd BufRead,BufNewFile *.phtml setlocal filetype=html
autocmd BufRead,BufNewFile *.blade.php setlocal filetype=html
autocmd FileType html,xml setlocal shiftwidth=2
autocmd FileType html,xml setlocal softtabstop=2
autocmd FileType html,xml setlocal tabstop=2

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
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256
set guifont=Inconsolata\ for\ Powerline:h18

" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.(git|hg|svn|build|)$',
            \ 'file': '\.(exe|so|dll|pyc|pdf|o)$',}
nnoremap <C-U> :CtrlPMRU<CR>
nnoremap <leader>. :CtrlPTag<cr>

" YouCompleteMe
map <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0

autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

set pastetoggle=<leader>v
imap jk <Esc>

" auto-pairs
let g:AutoPairsFlyMode=1
let g:AutoPairsShortcutBackInsert='<leader>b'
