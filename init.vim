syntax on
filetype plugin indent on
set noswapfile
set noshowmode
set ignorecase
set smartcase
set smartindent
set fileformat=unix
set fileencodings=ucs-bom,utf-8,cp936,gb18030
set linebreak
set colorcolumn=80
set termguicolors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
color tender
highlight Visual guibg=#323232
highlight Normal guibg=#000001

nnoremap <silent> <c-u> :Mru<cr>
nnoremap <silent> <c-p> :call fzf#Open()<cr>
nnoremap <silent> <leader>t :TagbarToggle<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>f :NERDTreeFind<cr>
nnoremap <c-w><c-t> :call lv#Term()<cr>
tnoremap <c-w><c-t> <c-\><c-n>:call lv#Term()<cr>

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ execute "normal! g`\"" |
			\ endif
autocmd BufWritePre *.js,*.jsx,*.css,*.less,*.scss,*.json PrettierAsync
autocmd BufReadPost *.js,*.jsx,*.css,*.less,*.scss,*.json call lv#ExpandTab(2)
autocmd InsertLeave,CompleteDone *.go if pumvisible() == 0 | pclose | endif

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:ackprg = 'ag --vimgrep'
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▸', '▾']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:prettier#autoformat = 0
let g:go_fmt_command = "goimports"

if has('nvim')
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#file#enable_buffer_path = 1
	packadd deoplete
	packadd deoplete-go
endif
