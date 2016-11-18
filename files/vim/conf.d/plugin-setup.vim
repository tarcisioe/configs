" Netrw setup
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

" Airline Setup
let g:airline#extensions#tabline#enabled=1       " enable tabline upport
let g:airline#extensions#tabline#tab_nr_type=1   " show tab numbers
let g:airline#extensions#tabline#show_buffers=0  " hide buffers
let g:airline#extensions#tabline#tab_min_count=2 " hide tabline for one tab

" Syntastic setup
let g:syntastic_auto_jump=1                " jump to first error
let g:syntastic_always_populate_loc_list=1 " enable :lnext
