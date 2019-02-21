" Vundle setup
call plug#begin()

Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'chrisbra/NrrwRgn'
Plug 'osyo-manga/vim-over'
Plug 'w0rp/ale'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'

Plug 'ncm2/ncm2-bufword'

" SnipMate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'

" Python
Plug 'ncm2/ncm2-jedi'
Plug 'michaeljsmith/vim-indent-object'
Plug 'alfredodeza/pytest.vim'

" LanguageServer
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" C++
Plug 'ncm2/ncm2-pyclang'

" Rust
Plug 'rust-lang/rust.vim'

" TypeScript
Plug 'leafgarland/typescript-vim'

" Theme
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline-themes' " zenburn for airline

call plug#end()
