local h = require("vim-helpers")

vim.g["airline#extensions#tabline#enabled"] = true
vim.g["airline#extensions#tabline#show_buffers"] = true
-- Show tab numbers
vim.g["airline#extensions#tabline#tab_nr_type"] = 1
-- Hide tabline when there is only one buffer
vim.g["airline#extensions#tabline#buffer_min_count"] = 2

if h.is_linux_terminal() then
    return
end

vim.g.airline_powerline_fonts = true
