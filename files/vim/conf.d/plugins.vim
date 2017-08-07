" Vundle setup
call plug#begin()

Plug 'gmarik/Vundle.vim'
Plug 'garbas/vim-snipmate'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'chrisbra/NrrwRgn'
Plug 'osyo-manga/vim-over'
Plug 'w0rp/ale'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Notes
Plug 'https://gitlab.com/tarcisioe/checknotes.vim.git'

" Python
Plug 'davidhalter/jedi-vim'
" Plug 'zchee/deoplete-jedi'
Plug 'michaeljsmith/vim-indent-object'

" C/C++
Plug 'roxma/clang_complete'
Plug 'vim-scripts/Conque-GDB'

" TypeScript
Plug 'Shougo/vimproc.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Theme
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline-themes' " zenburn for airline

call plug#end()
