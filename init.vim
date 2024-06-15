set nobackup
set noswapfile
set nowritebackup
set colorcolumn=80
set cursorline
set linebreak
set ignorecase
set fileencoding=utf-8
set smartcase
set diffopt+=indent-heuristic,algorithm:patience
set termguicolors
set formatoptions+=ro
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=1
set tagfunc=v:lua.vim.lsp.tagfunc
set completeopt=menu,menuone,noselect,preview
set laststatus=3
set mouse=

highlight StatusLine guibg=#444444 guifg=#b3deef

nnoremap <silent> <c-u> :Mru<cr>
nnoremap <silent> <c-p> :call fzf#Open()<cr>
nnoremap <silent> <leader>e :NvimTreeToggle<cr>
nnoremap <silent> <leader>f :NvimTreeFindFile<cr>

autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$")
      \ |   exe "normal! g`\""
      \ | endif
autocmd TextYankPost * call lv#copy()
autocmd InsertLeave * call lv#switchabc()
autocmd BufRead *.lua,*.proto call lv#expandtab(2)
autocmd BufRead *.css,*.html,*.js,*.json,*.lua call lv#expandtab(2)
autocmd BufRead *.vim nnoremap <buffer> <c-]> :call lv#vimjump()<cr>

command -nargs=1 Etab call lv#expandtab(<f-args>)

let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_width = 30

runtime vim.lua
