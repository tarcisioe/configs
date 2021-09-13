" Airline Setup
let g:airline#extensions#tabline#enabled=1       " enable tabline support
let g:airline#extensions#tabline#tab_nr_type=1   " show tab numbers
let g:airline#extensions#tabline#show_buffers=1  " show buffers
let g:airline#extensions#tabline#tab_min_count=2 " hide tabline for one tab
let g:airline#extensions#tabline#fnamemod = ':t' " show only filename on buffer

" Enable ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Language servers
lua << EOF
local nvim_lsp = require('lspconfig')
local ncm2 = require('ncm2')

local servers = { 'clangd', 'pylsp' }

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

end

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_init = ncm2.register_lsp_source,
        on_attach = on_attach,
    })
end
EOF
