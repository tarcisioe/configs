"General customizations

"   theme
if !(&term =~ 'linux')
    set t_Co=256 " 256 color
    colorscheme zenburn
    " remove bg color (use default one, normally transparent for me)
    hi Normal ctermfg=188 ctermbg=None
    set cursorline " highlight current line
    let g:airline_powerline_fonts=1 " use powerline arrows
    let g:airline_theme='zenburn'   " nicer theme
else
    colorscheme desert
endif

"   clear whitespace before saving
au BufWritePre * :%s/\s\+$//e

"   highlight stuff after column 88
match ErrorMsg '\%89v.\+'

let g:python_host_prog = $HOME . '/.local/nvenv/nvim2/bin/python'
let g:python3_host_prog = $HOME . '/.local/nvenv/nvim3/bin/python'

"   netrw (vim file manager) setup
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3

"   setup persistent undo (undo between sessions).
if has('persistent_undo')
    let undodir = '~/.vim/undodir'
    call system('mkdir ' . undodir)
    set undofile
endif

"   open file in last position
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif


