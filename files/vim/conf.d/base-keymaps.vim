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
nmap <silent> <leader>h :nohl<CR>

"   run lnext or lprev
nmap <silent> <leader>n :lnext<CR>
nmap <silent> <leader>p :lprev<CR>

"   toggle showing whitespace as characters
nmap <silent> <F11> :set list!<CR>

"   toggle relative line numbers
nmap <silent> <F12> :set rnu!<CR>

"   buffer navigation
nmap <silent> <leader>l :bnext<CR>
nmap <silent> <leader>h :bprevious<CR>
nmap <silent> <leader>bq :bp <BAR> bd #<CR>
nmap <silent> <leader>bl :ls<CR>

"   turn off arrows
nnoremap <silent> <Left> <NOP>
nnoremap <silent> <Down> <NOP>
nnoremap <silent> <Up> <NOP>
nnoremap <silent> <Right> <NOP>

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

"   call autocomplete with ctrl+space
inoremap <C-Space> <C-x><C-o>

" Visual mappings:
"   turn off arrows
vnoremap <silent> <Left> <NOP>
vnoremap <silent> <Down> <NOP>
vnoremap <silent> <Up> <NOP>
vnoremap <silent> <Right> <NOP>

"   copy on mouse selection
vmap <LeftRelease> "*ygv
