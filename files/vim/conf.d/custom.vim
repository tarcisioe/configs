" General customizations

" theme
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


" clear whitespace before saving
au BufWritePre * :%s/\s\+$//e
" highlight stuff after column 80
match ErrorMsg '\%81v.\+'

let g:python_host_prog = $HOME . '/.local/nvenv/nvim2/bin/python'
let g:python3_host_prog = $HOME . '/.local/nvenv/nvim3/bin/python'
