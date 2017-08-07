setlocal nosmartindent

let g:jedi#auto_vim_configuration=0  " avoid Ctrl+C override and doc window
let g:jedi#force_py_version=3
let g:syntastic_python_checkers=['flake8']
" let g:deoplete#sources.cpp=['jedi']

nmap <leader>t :!nosetests -v<CR>
nmap <leader>c :!nosetests --with-coverage --cover-erase --cover-package .<CR>
