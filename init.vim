set mouse=
set noswapfile
set nowritebackup
set linebreak
set cursorline
set colorcolumn=80
set smartcase
set ignorecase
set termguicolors
set formatoptions+=ro
set foldmethod=expr
set foldexpr=v:lua.vim.treesitter.foldexpr()
set completeopt+=fuzzy,noinsert,popup
set laststatus=3

highlight Normal guibg=none

nnoremap <silent> <leader>r :Mru<cr>
nnoremap <silent> <leader>s :call fzf#Open()<cr>
nnoremap <silent> <leader>e :NvimTreeToggle<cr>
nnoremap <silent> <leader>f :NvimTreeFindFile<cr>

autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$")
      \ |   exe "normal! g`\""
      \ | endif
autocmd TextYankPost * call lv#copy()
autocmd InsertLeave * call lv#switchabc()
autocmd BufRead *.vim nnoremap <buffer> <c-]> :call lv#vimjump()<cr>
autocmd BufRead *.lua,*.proto,*.css,*.html,*.js,*.json call lv#expandtab(2)

command -nargs=1 Etab call lv#expandtab(<f-args>)

runtime vim.lua
