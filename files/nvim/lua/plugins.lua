require("rocks-setup")

require("plugin-configs.vim-airline")
require("plugin-configs.zenburn")
require("plugin-configs.coq_nvim")
require("plugin-configs.nvim-lspconfig")

local function neorg_config()
    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/notes",
                    }
                },
            },
        },
    }
end
