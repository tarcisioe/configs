local h = require("vim-helpers")

vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        recommended = false,
        bigger_preview = "",
        jump_to_mark = "",
    },
    clients = {
        lsp = { always_on_top = {} },
        tags = { enabled = false },
        tree_sitter = { enabled = false },
        tmux = { enabled = false },
    },
    display = {
        preview = {
            border = {
                {"", "NormalFloat"},
                {"", "NormalFloat"},
                {"", "NormalFloat"},
                {" ", "NormalFloat"},
                {"", "NormalFloat"},
                {"", "NormalFloat"},
                {"", "NormalFloat"},
                {" ", "NormalFloat"},
            }
        }
    }
}
