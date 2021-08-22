" Plug setup
call plug#begin()

Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'osyo-manga/vim-over'
Plug 'SirVer/ultisnips'

" Theme
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline-themes' " Contains zenburn for airline

" Static check
Plug 'dense-analysis/ale'

" Completion
Plug 'roxma/nvim-yarp'  " required by ncm2
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'  " Buffer word completionn
Plug 'ncm2/ncm2-path'  " Path-completion
Plug 'ncm2/ncm2-jedi'  " Python
Plug 'ncm2/ncm2-pyclang'  " C and C++

" Emmet
Plug 'mattn/emmet-vim'

" Python
Plug 'michaeljsmith/vim-indent-object'  " Handle intended blocks as text objects
Plug 'alfredodeza/pytest.vim'  " Run pytest from vim.

call plug#end()
