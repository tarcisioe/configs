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

" CoC custom colors
hi CocErrorSign ctermfg=174 cterm=bold
hi CocWarningSign ctermfg=228 cterm=bold
