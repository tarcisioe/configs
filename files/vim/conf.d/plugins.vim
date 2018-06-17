" Vundle setup
call plug#begin()

Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'chrisbra/NrrwRgn'
Plug 'osyo-manga/vim-over'
Plug 'w0rp/ale'
Plug 'roxma/nvim-completion-manager'

" SnipMate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'

" Python
Plug 'michaeljsmith/vim-indent-object'

" C/C++
Plug 'vim-scripts/Conque-GDB'
Plug 'roxma/ncm-clang'

" LanguageServer
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Rust
Plug 'rust-lang/rust.vim'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript'

" Theme
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline-themes' " zenburn for airline

call plug#end()
