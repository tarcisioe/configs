setlocal cinoptions=g0  " make C++ scope specifiers unindented

let b:ale_linters=['clangcheck', 'clangtidy']
let b:ale_fixers=['clang-format', 'clangtidy']

nmap <leader>i :ALEFix<CR>
