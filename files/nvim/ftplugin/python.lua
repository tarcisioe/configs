local set = require("vim-helpers").set

set({ 'n' }, '<leader>f', ':silent !summon fortmat %<CR>', { force_remap = true })
