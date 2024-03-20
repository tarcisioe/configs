local h = require("vim-helpers")
local set = h.set

-- Airline Setup
vim.g["airline#extensions#tabline#enabled"] = true
vim.g["airline#extensions#tabline#show_buffers"] = true  -- Show buffers
vim.g["airline#extensions#tabline#tab_nr_type"] = 1  -- Show tab numbers
vim.g["airline#extensions#tabline#tab_min_count"] = 2  -- Hide tabline when there is only one tab

vim.g["coc_global_extensions"] = {
    "coc-lua",
    "coc-json",
}

-- Completion mappings
set("i", "<Tab>", h.or_key(h.confirm_completion, "<Tab>"), { noremap = true, expr = true })
set("i", "<C-j>", h.or_key(h.next_completion, "<C-j>"), { noremap = true, expr = true })
set("i", "<C-k>", h.or_key(h.prev_completion, "<C-k>"), { noremap = true, expr = true })

-- LSP functionality mappings
set("n", "gD", "<Plug>(coc-declaration)")
set("n", "gd", "<Plug>(coc-definition)")
set("n", "gr", "<Plug>(coc-references)")
set("n", "<leader>rn", "<Plug>(coc-rename)")

set("n", "<C-h>", "<Plug>(coc-diagnostic-prev)")
set("n", "<C-l>", "<Plug>(coc-diagnostic-next)")

-- Show documentation in a preview window
set("n", "<leader>k", h.show_documentation, { noremap = true })

set("n", "<leader>ac", "<Plug>(coc-codeaction)")

set({"n", "x"}, "<leader>f", "<Plug>(coc-format-selected)")
