let g:tsuquyomi_disable_quickfix = 1

function! TSLint(buffer) abort
    return {
    \    'command': 'tslint --fix %t',
    \   'read_temporary_file': 1,
    \}
endfunction

let g:ale_linters.typescript = ['tsserver']
let g:ale_fixers.typescript = ['TSLint']
let g:ale_fix_on_save = 1
