call plug#begin('~/.config/nvim/vendor')
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jacoborus/tender.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lvht/fzf-mru'|Plug 'junegunn/fzf'
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
Plug 'lvht/phpcd.vim', { 'do': 'composer update' }
Plug 'lvht/phpfold.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'w0rp/ale'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'justinmk/vim-syntax-extra'
Plug 'wavded/vim-stylus'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown'
Plug 'lvht/tagbar-markdown'
Plug 'ironhouzi/vim-stim'
Plug 'jreybert/vimagit'
Plug 'Shougo/neosnippet.vim'|Plug 'Shougo/neosnippet-snippets'
Plug 'fatih/vim-go'
Plug 'jceb/vim-orgmode'
call plug#end()
