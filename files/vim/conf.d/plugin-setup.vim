" Deoplete setup
let g:deoplete_enable_on_startup = 1

" Deoplete-jedi setup
let g:deoplete#sources#jedi#server_timeout = 400

" Netrw setup
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3

" Airline Setup
let g:airline#extensions#tabline#enabled = 1       " enable tabline upport
let g:airline#extensions#tabline#tab_nr_type = 1   " show tab numbers
let g:airline#extensions#tabline#show_buffers = 0  " hide buffers
let g:airline#extensions#tabline#tab_min_count = 2 " hide tabline for one tab

" Make nvim-completion-manager use deoplete as well
" force init deoplete then hack deoplete's mapping
call deoplete#enable()

" register as ncm source
au User CmSetup call cm#register_source({'name' : 'deoplete',
        \ 'priority': 7,
        \ 'abbreviation': '',
        \ })

" hack deoplete's mapping
inoremap <silent> <Plug>_ <C-r>=g:Deoplete_ncm()<CR>

func! g:Deoplete_ncm()
  " forward to ncm
  call cm#complete('deoplete', cm#context(), g:deoplete#_context.complete_position + 1, g:deoplete#_context.candidates)
  return ''
endfunc

" Configure deoplete to not have useless completions
let g:deoplete#ignore_sources._ = {}
let g:deoplete#ignore_sources._ = [
      \   'buffer',
      \   'member',
      \   'tag',
      \   'file',
      \   'around',
       \ ]
