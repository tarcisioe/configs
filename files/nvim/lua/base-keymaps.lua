local h = require("vim-helpers")
local set = h.set

vim.g.mapleader = ","

-- Quit vim when no changes were made
set("n", "q", ":q<CR>")

-- Indent the whole file
set("n", "<leader>i", "gg=G")

-- Run "spawn" script for opening a new terminal
set("n", "<leader>c", ":!spawn<CR><CR>")

-- Remove all highlights
set("n", "<leader>H", ":nohl<CR>")

-- Toggle showing whitespace as characters
set({"i", "n", "v"}, "<F10>", h.toggle_whitespace)

-- Toggle line numbers
set({"i", "n", "v"}, "<F11>", h.toggle_line_numbers)

-- Toggle line numbers
set({"n", "v", "i"}, "<F12>", h.toggle_relative_line_numbers)

-- Buffer navigation
set("n", "<leader>h", ":bprevious<CR>")
set("n", "<leader>l", ":bnext<CR>")
set("n", "<leader>bl", ":ls<CR>")

-- Close current buffer
set("n", "<leader>q", ":bprevious <BAR> bdelete #<CR>")

-- Disable help on F1
set("i", "<F1>", "<NOP>")

-- Disable arrows
set({"i", "n", "v"}, "<Left>", "<NOP>", { noremap = true })
set({"i", "n", "v"}, "<Down>", "<NOP>", { noremap = true })
set({"i", "n", "v"}, "<Up>", "<NOP>", { noremap = true })
set({"i", "n", "v"}, "<Right>", "<NOP>", { noremap = true })

-- Call autocomplete
set("i", "<C-Space>", "<C-x><C-o>", { noremap = true })

-- Copy on mouse selection
set("v", "<LeftRelease>", '"*ygv')
