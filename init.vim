call plug#begin() " {{{
Plug 'vim-airline/vim-airline'
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
Plug 'vim-scripts/matchit.zip'
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'lvht/phpfold.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'w0rp/ale'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'justinmk/vim-syntax-extra'
Plug 'wavded/vim-stylus', { 'for': 'scss' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'lvht/tagbar-markdown', { 'for': 'markdown' }
Plug 'ironhouzi/vim-stim'
Plug 'jreybert/vimagit'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'cespare/vim-toml'
Plug 'Lenovsky/nuake'
call plug#end() " }}}

color tender " {{{
highlight Normal guibg=#000001 " 纯黑背景，酷
highlight Visual guibg=#323232 ctermbg=0
highlight Todo guifg=yellow guibg=bg gui=bold
" }}}

set colorcolumn=80 " {{{
set cursorline
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
set conceallevel=2
set maxmempattern=2000000
" }}}

nnoremap <silent> <CR> :noh<CR><CR>

autocmd FileType vim setlocal foldmethod=marker " {{{
autocmd FileType html,css,scss,javascript,tex call lv#ExpandTab(2)
autocmd FileType php,python,json,nginx,proto call lv#ExpandTab(4)
autocmd BufRead composer.lock setlocal ft=json
autocmd BufRead *.phpt setlocal ft=php
autocmd BufRead *.phtml setlocal ft=html

" 将光标跳转到上次打开当前文件的位置 {{{
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif " }}}
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

" airline {{{
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#skip_indent_check_ft = {'go': ['mixed-indent-file']}
" }}}
