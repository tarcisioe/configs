local plug = vim.fn["plug#"]

vim.fn["plug#begin"]()

plug("bling/vim-airline")
plug("tpope/vim-surround")
plug("tpope/vim-repeat")
plug("osyo-manga/vim-over")

-- Themes
plug("jnurmine/Zenburn")
plug("vim-airline/vim-airline-themes") -- contains Zenburn for airline

-- LSP/Completion/Everything
plug("neoclide/coc.nvim", { branch = "release" })

-- Misc
plug("mattn/emmet-vim")
plug("michaeljsmith/vim-indent-object")
plug("alfredodeza/pytest.vim")

vim.fn["plug#end"]()
