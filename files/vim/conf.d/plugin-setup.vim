" Airline Setup
let g:airline#extensions#tabline#enabled=1       " enable tabline support
let g:airline#extensions#tabline#tab_nr_type=1   " show tab numbers
let g:airline#extensions#tabline#show_buffers=0  " hide buffers
let g:airline#extensions#tabline#tab_min_count=2 " hide tabline for one tab

" Enable ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
