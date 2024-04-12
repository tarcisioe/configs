local set = require("vim-helpers").set

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if (
            vim.uv.fs_stat(vim.fs.joinpath(path, ".luarc.json")) or
            vim.uv.fs_stat(vim.fs.joinpath(path, ".luarc.jsonc"))
        ) then
            return
        end

        local configs = {
            runtime = {
                version = "LuaJIT"
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library"
                },
            },
        }

        client.config.settings.Lua = vim.tbl_deep_extend(
            "force",
            client.config.settings.Lua,
            configs
        )
    end,
    settings = {
        Lua = {},
    },
})

lspconfig.clangd.setup({})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})

set("n", "<leader>e", vim.diagnostic.open_float)
set("n", "<C-h>", vim.diagnostic.goto_prev)
set("n", "<C-l>", vim.diagnostic.goto_next)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local lsp_config_group = augroup("user_lsp_config", {})

autocmd(
    "LspAttach",
    {
        group = lsp_config_group,
        callback = function(ev)
            local opts = { buffer = ev.buf }

            set("n", "gd", vim.lsp.buf.definition, opts)
            set("n", "gD", vim.lsp.buf.declaration, opts)
            set("n", "gr", vim.lsp.buf.references, opts)
            set("n", "<leader>k", vim.lsp.buf.hover, opts)
            set("n", "<leader>K", vim.lsp.buf.signature_help, opts)
            set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            set("n", "<leader>f",
                function()
                    vim.lsp.buf.format({ async = true })
                end,
                opts
            )
            set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
    }
)
