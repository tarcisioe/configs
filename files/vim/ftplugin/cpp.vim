setlocal cinoptions=g0  " make C++ scope specifiers unindented

" Enable C++11 in syntastic
let g:ale_linters.cpp=['clang']
let g:ale_cpp_clang_options='-std=c++17'
let g:ale_cpp_clangcheck_options='-std=c++17'
let g:ale_cpp_clangtidy_options='-std=c++17'
let g:ale_cpp_clangtidy_checks=[]
let g:ale_cpp_gcc_options='-std=c++17'

let g:ale_cpp_clang_options='-std=c++17'
let g:ale_cpp_clangcheck_options='-std=c++17'
let g:ale_cpp_gcc_options='-std=c++17'

let g:clang_cpp_options='-std=c++1z'
let g:clang_dotfile='.clang_complete'
let g:clang_diagsopt=''

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
