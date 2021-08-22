set nocompatible                "no vi compatibility

syntax on                       "enable syntax highlighting
filetype plugin on              "enable plugins for filetypes

set autochdir                   "change directory to where the file is
set backspace=indent,eol,start  "make backspace work everywhere
set clipboard=unnamedplus       "make vim clipboard the same as the system one
set guicursor=                  "leave terminal cursor as is
set laststatus=2                "alway have a status line
set mouse=a                     "get mouse working on mouse-capable terminals
set nobackup                    "no annoying backups of files
set nofoldenable                "disable default folding of text
set number                      "line numbers
set path=**                     "make file search recursive
set ruler                       "show row and column on bottom right
if !empty($VIM_NO_TITLE)
    set notitle                 "avoid setting the terminal window title
else
    set title                   "set the terminal window title
endif
set ttimeoutlen=0               "no delay when going back into normal mode
set wildmenu                    "enable cool menu

set expandtab                   "spaces instead of tab
set tabstop=4                   "tabwidth is 4 spaces
set shiftwidth=4                "indent by 4 with >> and <<
set autoindent                  "start nextline indented

set hlsearch                    "highlight searches
set incsearch                   "do incremental searching
set showmatch                   "jump to matches when entering regexp
set ignorecase                  "ignore case on search
set smartcase                   "uppercase forces search casing

set completeopt-=preview        "no preview window for completion

set listchars=tab:——,space:·

