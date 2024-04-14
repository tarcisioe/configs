-- Hey, overwriting `require` looks bad but then the LSP can still go to
-- definition ¯\_(ツ)_/¯
local original_require = require
local require = require("safe-require")

require("base-opts")
require("base-keymaps")
require("custom")
require("rocks-setup")

require = original_require

require("userconfig.health").notify()
