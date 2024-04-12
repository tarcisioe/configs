require("zenburn").setup()

vim.cmd.highlight("clear", "Normal")
vim.cmd.highlight("Normal", "ctermbg=None guibg=None")

---- Custom nvim-lsp highlighting
vim.cmd.highlight("DiagnosticHint", "ctermfg=DarkGrey")
vim.cmd.highlight("DiagnosticWarn", "ctermfg=228 cterm=bold")
vim.cmd.highlight("DiagnosticError", "ctermfg=174 cterm=bold")

vim.cmd.highlight("clear", "Pmenu")
vim.cmd.highlight("Pmenu", "ctermbg=236")
vim.cmd.highlight("clear", "PmenuSel")
vim.cmd.highlight("PmenuSel", "cterm=bold ctermbg=238")
