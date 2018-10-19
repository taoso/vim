call plug#begin() " {{{
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jacoborus/tender.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
Plug 'lvht/fzf-mru'
Plug 'mileszs/ack.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Townk/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'StanAngeloff/php.vim'
Plug 'lvht/phpcd.vim'
Plug 'lvht/phpfold.vim'
Plug 'w0rp/ale'
Plug 'hynek/vim-python-pep8-indent'
Plug 'justinmk/vim-syntax-extra'
Plug 'wavded/vim-stylus'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent'
Plug 'othree/yajs.vim'
Plug 'plasticboy/vim-markdown'
Plug 'lvht/tagbar-markdown'
Plug 'ironhouzi/vim-stim'
Plug 'jreybert/vimagit'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'cespare/vim-toml'
Plug 'Lenovsky/nuake'
call plug#end() " }}}

color tender " {{{
highlight Normal guibg=#000001
highlight Visual guibg=#323232
highlight Todo guifg=yellow guibg=bg gui=bold
highlight StatusLine guifg=NONE guibg=#323232 gui=bold
" }}}

set colorcolumn=80 " {{{
set linebreak
set list
set fileformat=unix
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termguicolors
set noswapfile
set ignorecase
set smartcase
set smartindent
set pastetoggle=<leader>v
set maxmempattern=2000000
" }}}

nnoremap <silent> <CR> :noh<CR><CR>

autocmd FileType vim setlocal foldmethod=marker " {{{
autocmd FileType html,css,scss,javascript,tex call lv#ExpandTab(2)
autocmd FileType php,python,json,nginx,proto call lv#ExpandTab(4)
" 将光标跳转到上次打开当前文件的位置
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif
" }}}

" Tagbar {{{
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▸', '▾']
" }}}

" NERD Tree {{{
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" }}}

" ack {{{
let g:ackprg = 'ag --vimgrep --ignore tags'
" }}}

" fzf {{{
let g:fzf_root = lv#FindRoot()
let g:fzf_mru_file_list_size = 100
execute "nnoremap <silent> <C-p> :FZF ".g:fzf_root."<CR>"
nnoremap <silent> <C-u> :FZFMru<CR>
" }}}

" ale {{{
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1
" }}}

" go {{{
autocmd InsertLeave,CompleteDone *.go if pumvisible() == 0 | pclose | endif
let g:go_fmt_command = "goimports"
let g:go_term_enabled = 0
" }}}
