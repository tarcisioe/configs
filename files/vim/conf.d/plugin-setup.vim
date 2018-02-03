" Netrw setup
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Airline Setup
let g:airline#extensions#tabline#enabled=1       " enable tabline support
let g:airline#extensions#tabline#tab_nr_type=1   " show tab numbers
let g:airline#extensions#tabline#show_buffers=0  " hide buffers
let g:airline#extensions#tabline#tab_min_count=2 " hide tabline for one tab

" Setup SnipMate
let g:snips_no_mappings = 1
" wrap the mapping
imap <expr> <Plug>(snipmate_force_trigger) pumvisible() ? "\<c-y>\<Plug>snipMateTrigger" : "\<Plug>snipMateTrigger"

" show a list of snippets when no the user has typed nothing
inoremap <silent> <c-u> <c-r>=cm#sources#snipmate#trigger_or_popup("\<Plug>(snipmate_force_trigger)")<cr>
vmap <c-u> <Plug>snipMateTrigger
imap <expr> <c-j> pumvisible() ? "\<c-y>\<Plug>snipMateNextOrTrigger" : "\<Plug>snipMateNextOrTrigger"
vmap <c-j> <Plug>snipMateNextOrTrigger
imap <expr> <c-k> pumvisible() ? "\<c-y>\<Plug>snipMateBack" : "\<Plug>snipMateBack"
vmap <c-k> <Plug>snipMateBack
