" Plug setup
call plug#begin()

Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'osyo-manga/vim-over'
" Plug 'SirVer/ultisnips'

" Theme
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline-themes' " Contains zenburn for airline

" LSP/completion/everything
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Emmet
Plug 'mattn/emmet-vim'

" Python
Plug 'michaeljsmith/vim-indent-object'  " Handle intended blocks as text objects
Plug 'alfredodeza/pytest.vim'  " Run pytest from vim.

call plug#end()
