autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif

syntax on
filetype plugin indent on

set noswapfile
set ignorecase
set smartcase
set autoindent
set encoding=utf-8
set fileencodings=utf-8,gb18030
set fileformat=unix
set colorcolumn=80
set cursorline
set linebreak
set laststatus=2
set maxmempattern=2000000
set backspace=indent,eol,start

set termguicolors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
color tender
highlight Visual guibg=#323232
highlight Normal guibg=#000001
highlight StatusLine guibg=#444444 guifg=#b3deef
highlight StatusLineTerm guibg=#444444 guifg=#b3deef
highlight StatusLineTermNC guibg=#444444 guifg=#999999

nnoremap <silent> <c-u> :Mru<cr>
nnoremap <silent> <c-p> :call fzf#Open()<cr>
nnoremap <silent> <leader>t :TagbarToggle<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>f :NERDTreeFind<cr>

autocmd BufReadPost *.js,*.ts,*.css,*.json call lv#ExpandTab(2)
autocmd FileType proto call lv#ExpandTab(4)
autocmd FileType yaml setlocal foldmethod=indent|call lv#ExpandTab(2)
autocmd FileType go setlocal formatoptions+=ro
autocmd InsertLeave,CompleteDone *.go if pumvisible() == 0 | pclose | endif

command -nargs=1 ExpandTab call lv#ExpandTab(<f-args>)

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize=24
let g:ackprg = 'ag --vimgrep'
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_width = 30
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
