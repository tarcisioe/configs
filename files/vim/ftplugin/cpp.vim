setlocal cinoptions=g0  " make C++ scope specifiers unindented

let g:ale_linters.cpp=['clangcheck']

" let arrows work normally
silent! iunmap <Left>
silent! iunmap <Up>
silent! iunmap <Down>
silent! iunmap <Right>

nmap <silent> <leader>i ma:.!uncrustify --frag -c ~/.uncrustify.cfg -l CPP -q<CR>'a
vmap <silent> <leader>i ma:'<,'>!uncrustify --frag -c ~/.uncrustify.cfg -l CPP -q<CR>'a
map <silent> <leader>c :pyf ~/.vim/clang-format.py<CR>
imap <silent> <leader>c <C-o>:pyf ~/.vim/clang-format.py<CR>

inoremap <NUL> <C-X><C-U>
