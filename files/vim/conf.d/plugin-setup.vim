" Airline Setup
let g:airline#extensions#tabline#enabled=1       " enable tabline support
let g:airline#extensions#tabline#tab_nr_type=1   " show tab numbers
let g:airline#extensions#tabline#show_buffers=1  " show buffers
let g:airline#extensions#tabline#tab_min_count=2 " hide tabline for one tab
let g:airline#extensions#tabline#fnamemod = ':t' " show only filename on buffer

let g:coc_global_extensions = [
\   'coc-cmake',
\   'coc-clangd',
\   'coc-json',
\   'coc-pyright',
\   'coc-tsserver',
\   'coc-vimlsp',
\]

inoremap <silent><expr> <C-n> coc#refresh()

" lsp functionality mappings
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)

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
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
