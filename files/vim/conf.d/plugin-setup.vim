" Deoplete setup
let g:deoplete#enable_at_startup = 1

" Deoplete-jedi setup
let g:deoplete#sources#jedi#server_timeout = 400

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
" let g:airline_section_z=airline#section#create("%l\:%c")

" Syntastic setup
let g:syntastic_auto_jump=1                " jump to first error
let g:syntastic_always_populate_loc_list=1 " enable :lnext
