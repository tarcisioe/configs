local h = require("vim-helpers")

if h.is_linux_terminal() then
    vim.cmd.colorscheme("desert")

    return
end

-- General theme
vim.cmd.colorscheme("zenburn")
vim.cmd.highlight("Normal", "ctermfg=188 ctermbg=None")
---- Custom nvim-lsp highlighting
vim.cmd.highlight("DiagnosticHint", "ctermfg=DarkGrey")
vim.cmd.highlight("DiagnosticWarn", "ctermfg=228 cterm=bold")
vim.cmd.highlight("DiagnosticError", "ctermfg=174 cterm=bold")
