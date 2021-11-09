set noswapfile
set colorcolumn=80
set cursorline
set nowrap
set ignorecase
set smartcase
set diffopt+=indent-heuristic,algorithm:patience
set termguicolors
set tabline=%!lv#numtab()
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=1

color tender
autocmd ColorScheme tender hi Normal guibg=#000000
                       \ | hi SignColumn guibg=#000000
                       \ | hi StatusLine guibg=#444444 guifg=#b3deef

nnoremap <silent> <c-u> :Mru<cr>
nnoremap <silent> <c-p> :call fzf#Open()<cr>
nnoremap <silent> <leader>t :TagbarToggle<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>f :NERDTreeFind<cr>

autocmd TextYankPost * call lv#copy()
autocmd BufReadPost * call lv#lastline()
autocmd InsertLeave * call lv#switchabc()

command -nargs=1 ExpandTab call lv#expandtab(<f-args>)

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 24
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_width = 30
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0

runtime vim.lua
