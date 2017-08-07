" Vundle setup
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'chrisbra/NrrwRgn'
Plugin 'osyo-manga/vim-over'
Plugin 'w0rp/ale'

" Notes
Plugin 'https://gitlab.com/tarcisioe/checknotes.vim.git'

" Python
Plugin 'davidhalter/jedi-vim'
Plugin 'michaeljsmith/vim-indent-object'

" C/C++
"Plugin 'Rip-Rip/clang_complete'
Plugin 'justmao945/vim-clang'
Plugin 'vim-scripts/Conque-GDB'

" TypeScript
Plugin 'Shougo/vimproc.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

" Theme
Plugin 'jnurmine/Zenburn'
Plugin 'vim-airline/vim-airline-themes' " zenburn for airline

call vundle#end()

filetype plugin indent on
