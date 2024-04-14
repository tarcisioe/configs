local h = require("vim-helpers")
local set = h.set
local cmp_set = h.cmp_set

vim.g.mapleader = ","

-- Quit vim when no changes were made
set("n", "q", vim.cmd.quit)

-- Indent the whole file
set("n", "<leader>i", "gg=G")

-- Run "spawn" script for opening a new terminal
set("n", "<leader>c", ":!spawn<CR><CR>")

-- Remove all highlights
set("n", "<leader>nh", vim.cmd.nohl)

-- Toggle showing whitespace as characters
set({ "i", "n", "v" }, "<F10>", h.toggle_whitespace)

-- Toggle line numbers
set({ "i", "n", "v" }, "<F11>", h.toggle_line_numbers)

-- Toggle line numbers
set({ "n", "v", "i" }, "<F12>", h.toggle_relative_line_numbers)

-- Buffer navigation
set("n", "<leader>h", vim.cmd.bprevious)
set("n", "<leader>l", vim.cmd.bnext)
set("n", "<leader>bl", vim.cmd.ls)

-- Close current buffer
set("n", "<leader>q", h.close_current_buffer)

-- Disable help on F1
set({ "i", "n", "v" }, "<F1>", "<NOP>")

-- Disable arrows
set({ "i", "n", "v" }, "<Left>", "<NOP>", { noremap = true })
set({ "i", "n", "v" }, "<Down>", "<NOP>", { noremap = true })
set({ "i", "n", "v" }, "<Up>", "<NOP>", { noremap = true })
set({ "i", "n", "v" }, "<Right>", "<NOP>", { noremap = true })

-- Call autocomplete
set("i", "<C-Space>", "<C-x><C-o>", { noremap = true })

cmp_set("<Esc>", "<C-e><Esc>")
cmp_set("<BS>", "<C-e><BS>")
cmp_set("<Tab>", h.confirm_completion)
cmp_set("<C-j>", "<C-n>")
cmp_set("<C-k>", "<C-p>")

-- Copy on mouse selection
set("v", "<LeftRelease>", '"*ygv')

-- Open another file
set("n", "<leader>fo", ":e ", { silent = false })
set("n", "<leader>fO", ":e %:h/", { silent = false })
