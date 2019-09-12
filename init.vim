set noswapfile
set encoding=utf-8
set fileencodings=utf-8,gb18030
set backspace=eol,start,indent
set laststatus=2
set colorcolumn=80
set cursorline
set linebreak
set autoindent
set ignorecase
set smartcase
set ruler
set diffopt+=internal,indent-heuristic,algorithm:patience

filetype plugin indent on
syntax on

set termguicolors
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
nnoremap <silent> <leader>c :call lv#Term()<cr>

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd BufReadPost *.js,*.ts,*.css,*.json,*.yaml call lv#ExpandTab(2)
autocmd FileType proto call lv#ExpandTab(4)
autocmd FileType go setlocal formatoptions+=ro

autocmd FileType vim nnoremap <buffer> <c-]> :call vim#Jump()<cr>

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
