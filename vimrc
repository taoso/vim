syntax on
filetype plugin indent on
set noswapfile

set noshowmode
set termguicolors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
highlight Visual guibg=#323232

nnoremap <silent> <c-u> :Mru<cr>
nnoremap <silent> <c-p> :call fzf#Open()<cr>
nnoremap <silent> <leader>t :TagbarToggle<cr>

autocmd BufReadPost * if line("\"") > 0 | execute "normal! g`\"" | endif

let g:netrw_dirhistmax = 0
