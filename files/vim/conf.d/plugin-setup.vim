" Airline Setup
let g:airline#extensions#tabline#enabled=1       " enable tabline support
let g:airline#extensions#tabline#tab_nr_type=1   " show tab numbers
let g:airline#extensions#tabline#show_buffers=1  " show buffers
let g:airline#extensions#tabline#tab_min_count=2 " hide tabline for one tab
let g:airline#extensions#tabline#fnamemod = ':t' " show only filename on buffer

let g:coc_global_extensions = [
\   'coc-clangd',
\   'coc-cmake',
\   'coc-json',
\   'coc-pyright',
\   'coc-rust-analyzer',
\   'coc-tsserver',
\   'coc-vimlsp',
\]

inoremap <silent><expr> <Tab>
    \ coc#pum#visible() ? coc#pum#confirm() :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <silent><expr> j
    \ coc#pum#visible() ? coc#pum#next(1) : "\j"
inoremap <silent><expr> k
    \ coc#pum#visible() ? coc#pum#prev(1) : "\k"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" lsp functionality mappings
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)

nmap <silent> <c-h> <Plug>(coc-diagnostic-prev)
nmap <silent> <c-l> <Plug>(coc-diagnostic-next)

" show documentation in preview window.
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" apply action
nmap <leader>ac <Plug>(coc-codeaction)

" format code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
