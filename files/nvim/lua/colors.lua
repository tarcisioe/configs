local h = require("vim-helpers")

-- Avoid weird colors
if h.is_linux_terminal() then
    vim.cmd.colorscheme("desert")

    return
end

-- General theme
vim.cmd.colorscheme("zenburn")
vim.cmd.highlight("Normal", "ctermfg=188 ctermbg=None")
---- Custom CoC highlighting
vim.cmd.highlight("CocErrorSign", "ctermfg=174 cterm=bold")
vim.cmd.highlight("CocWarningSign", "ctermfg=228 cterm=bold")
---- Make virtual text a ghostly grey
vim.cmd.highlight("CocVirtualText", "ctermfg=DarkGrey")
---- Use Zenburn's string pink for CoC search text
vim.cmd.highlight("CocSearch", "ctermfg=174")

-- Highlight the current line
vim.o.cursorline = true

-- Airline font and theme
vim.g.airline_powerline_fonts = true
vim.g.airline_theme = "zenburn"
