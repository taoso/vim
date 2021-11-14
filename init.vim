set noswapfile
set colorcolumn=80
set cursorline
set linebreak
set ignorecase
set smartcase
set diffopt+=indent-heuristic,algorithm:patience
set termguicolors
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=1

color tender
highlight Normal guibg=#000000
highlight SignColumn guibg=#000000
highlight StatusLine guibg=#444444 guifg=#b3deef

nnoremap <silent> <c-u> :Mru<cr>
nnoremap <silent> <c-p> :call fzf#Open()<cr>
nnoremap <silent> <leader>t :TagbarToggle<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>f :NERDTreeFind<cr>

autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$")
      \ |   exe "normal! g`\""
      \ | endif
autocmd TextYankPost * call lv#copy()
autocmd InsertLeave * call lv#switchabc()
autocmd BufRead *.lua,*.proto call lv#expandtab(4)
autocmd BufRead *.css,*.html,*.js,*.json call lv#expandtab(2)
autocmd BufRead *.vim nnoremap <buffer> <c-]> :call lv#vimjump()<cr>

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
