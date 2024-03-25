local set_local = require("vim-helpers").set_local

set_local("n", "<leader>=", "yyp:s/./=/g<CR>:nohl<CR>")
set_local("n", "<leader>-", "yyp:s/./-/g<CR>:nohl<CR>")
set_local("n", "<leader>u", "@='0i#<C-V><ESC>'<CR>")
set_local("n", "<leader>b", "maysiw*lysiw*`all")
set_local("n", "<leader>i", "maysiw_`al", { force_remap = true })
set_local("n", "<leader>m", "maysiw``al")
