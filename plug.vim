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
Plug 'lvht/phpcd.vim', { 'do': 'composer update' }
Plug 'w0rp/ale'
Plug 'lvht/phpfold.vim', { 'for': 'php', 'do': 'composer update' }
Plug 'xsbeats/vim-blade'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'justinmk/vim-syntax-extra'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'wavded/vim-stylus'
Plug 'plasticboy/vim-markdown'
Plug 'lvht/tagbar-markdown'
Plug 'easymotion/vim-easymotion'
Plug 'ironhouzi/vim-stim'
Plug 'vimwiki/vimwiki'
Plug 'jreybert/vimagit'
Plug 'Shougo/neosnippet.vim'|Plug 'Shougo/neosnippet-snippets'
Plug 'fatih/vim-go'
call plug#end()
