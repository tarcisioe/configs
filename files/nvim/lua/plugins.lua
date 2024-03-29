local rocks = require("rocks-setup")

if not rocks then
    vim.notify("Rocks is not installed. Install it with luarocks to enable plugins.")
    return
end

local require = require("safe-require")

-- require("plugin-configs.vim-airline")
-- require("plugin-configs.zenburn")
-- require("plugin-configs.coq_nvim")
-- require("plugin-configs.nvim-lspconfig")
--
-- local function neorg_config()
--     require('neorg').setup {
--         load = {
--             ["core.defaults"] = {},
--             ["core.concealer"] = {},
--             ["core.dirman"] = {
--                 config = {
--                     workspaces = {
--                         notes = "~/notes",
--                     }
--                 },
--             },
--         },
--     }
-- end
