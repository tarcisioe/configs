setlocal cinoptions=g0  " make C++ scope specifiers unindented

" Enable C++11 in syntastic
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=1
let g:syntastic_cpp_config_file='.clang_complete'
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++1y'

" Enable C++11 in clang-complete
let g:clang_user_options='-std=c++1y'
