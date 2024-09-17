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

highlight Normal guibg=none
highlight StatusLine guibg=#444444 guifg=#b3deef
highlight VertSplit guifg=#282828 guibg=#282828

nnoremap <silent> <leader>r :Mru<cr>
nnoremap <silent> <leader>s :call fzf#Open()<cr>
nnoremap <silent> <leader>e :NvimTreeToggle<cr>
nnoremap <silent> <leader>f :NvimTreeFindFile<cr>

autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$")
      \ |   exe "normal! g`\""
      \ | endif
autocmd CompleteDone * pclose
autocmd TextYankPost * call lv#copy()
autocmd InsertLeave * call lv#switchabc()
autocmd BufRead *.vim nnoremap <buffer> <c-]> :call lv#vimjump()<cr>
autocmd BufRead *.lua,*.proto,*.css,*.html,*.js,*.json call lv#expandtab(2)

command -nargs=1 Etab call lv#expandtab(<f-args>)

runtime vim.lua
