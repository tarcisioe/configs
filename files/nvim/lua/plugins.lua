local h = require("vim-helpers")

local function airline_init()
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
end

local function coc_config()
    local c = require("coc-functions")
    local set = h.set

    vim.g["coc_global_extensions"] = {
        "coc-clangd",
        "coc-cmake",
        "coc-json",
        "coc-lua",
        "coc-pyright",
        "coc-rust-analyzer",
        "coc-snippets",
        "coc-tsserver",
        "coc-vimlsp",
    }

    -- Completion mappings
    set("i", "<Tab>", h.or_key(c.confirm_completion, "<Tab>"), { noremap = true, expr = true })
    set("i", "<C-j>", h.or_key(c.next_completion, "<C-j>"), { noremap = true, expr = true })
    set("i", "<C-k>", h.or_key(c.prev_completion, "<C-k>"), { noremap = true, expr = true })

    -- LSP functionality mappings
    set("n", "gD", "<Plug>(coc-declaration)")
    set("n", "gd", "<Plug>(coc-definition)")
    set("n", "gr", "<Plug>(coc-references)")
    set("n", "<leader>rn", "<Plug>(coc-rename)")

    set("n", "<C-h>", "<Plug>(coc-diagnostic-prev)")
    set("n", "<C-l>", "<Plug>(coc-diagnostic-next)")

    -- Show documentation in a preview window
    set("n", "<leader>k", c.show_documentation, { noremap = true })

    set("n", "<leader>ac", "<Plug>(coc-codeaction)")

    set({"n", "x"}, "<leader>f", "<Plug>(coc-format-selected)")
end

local function colorscheme_config()
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
end

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

require("lazy-bootstrap").setup({
    {
        "vim-airline/vim-airline",
        init = airline_init,
        dependencies = {
            "vim-airline/vim-airline-themes",
        }
    },
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "osyo-manga/vim-over",
    {
        "neoclide/coc.nvim",
        branch = "release",
        config = coc_config,
    },
    "mattn/emmet-vim",
    "michaeljsmith/vim-indent-object",
    "alfredodeza/pytest.vim",
    {
        "jnurmine/Zenburn",
        config = colorscheme_config,
        priority = 1000,
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        config = neorg_config,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    },
})
