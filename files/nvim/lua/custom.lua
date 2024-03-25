local h = require("vim-helpers")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local onread_group = augroup("onread", {})

-- Open file in the last position
autocmd(
    "BufReadPost",
    {
        pattern = "*",
        group = onread_group,
        callback = h.go_to_last_open_position
    }
)

local onwrite_group = augroup("onwrite", {})

-- Remove trailing whitespaces from lines
autocmd(
    "BufWritePre",
    {
        pattern = "*",
        group = onwrite_group,
        command = [[:%s/\s\+$//e]],
    }
)

-- Configure vim builtin file manager (netrw)
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

-- Enable undo between sessions
vim.opt.undofile = true
