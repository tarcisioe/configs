local set = require("vim-helpers").set

set("n", "<leader>=", "yyp:s/./=/g<CR>:nohl<CR>")
set("n", "<leader>-", "yyp:s/./-/g<CR>:nohl<CR>")
set("n", "<leader>u", "@='0i#<C-V><ESC>'<CR>")
set("n", "<leader>b", "maysiw*lysiw*`all")
set("n", "<leader>i", "maysiw_`al", { force_remap = true })
set("n", "<leader>m", "maysiw``al")
