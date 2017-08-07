" Key mappings
let mapleader=','
" Normal mappings:
"   quit with q when no changes were made
nmap <silent> q :q<CR>
nmap <silent> <leader>q :q all<CR>
"   indent the whole file
nmap <silent> <leader>i gg=G''
"   run spawn script for opening new terminal
nmap <silent> <leader>c :!spawn<CR><CR>
"   remove highlights
"nnoremap <silent> <ESC> :nohl<CR><ESC>
nmap <silent> <leader>h :nohl<CR>
"   run lnext or lprev
nmap <silent> <leader>n :lnext<CR>
nmap <silent> <leader>p :lprev<CR>
"   toggle showing whitespace as characters
nmap <silent> <F11> :set list!<CR>
"   toggle relative line numbers
nmap <silent> <F12> :set rnu!<CR>
"   turn off arrows
noremap <silent> <Left> <NOP>
noremap <silent> <Down> <NOP>
noremap <silent> <Up> <NOP>
noremap <silent> <Right> <NOP>

" Insert mappings:
"   turn off arrows
inoremap <silent> <Left> <NOP>
inoremap <silent> <Down> <NOP>
inoremap <silent> <Up> <NOP>
inoremap <silent> <Right> <NOP>
"   disable F1 calling help
imap <silent> <F1> <NOP>
"   enable other F keys in insert mode as well
imap <silent> <F11> <C-o><F11>
imap <silent> <F12> <C-o><F12>
inoremap <C-Space> <C-x><C-o>

" Visual mappings:
"   narrow to region and maximize narrowed window
vmap <silent> <leader>nn :NR<CR><C-w>_
"   turn off arrows
vnoremap <silent> <Left> <NOP>
vnoremap <silent> <Down> <NOP>
vnoremap <silent> <Up> <NOP>
vnoremap <silent> <Right> <NOP>

" Needed for vim-over to work "smoothly"
cnoreabbr %s OverCommandLine<CR>%s
cnoreabbr '<,'>s OverCommandLine<CR>'<,'>s
cnoreabbr s/ OverCommandLine<CR>s/

cmap w!! w !sudo tee > /dev/null %
