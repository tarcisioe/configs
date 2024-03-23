local h = require("vim-helpers")

local function check_backspace()
    local col = vim.fn.col(".") - 1

    return (col == 0) or (vim.fn.getline("."):sub(col,col):match("%s") ~= nil)
end

local function coc_pum_visible()
    return h.vim_bool_call("coc#pum#visible")
end

local function call_help(word)
    return vim.cmd("h " .. word)
end

local function call_keywordprg(word)
    return vim.cmd("!" .. vim.o.keywordprg .. " " .. word)
end

local coc_functions = {}

function coc_functions.confirm_completion()
    if coc_pum_visible() then
        return vim.fn["coc#pum#confirm"]()
    end

    if not check_backspace() then
        return vim.fn["coc#refresh"]()
    end

    return nil
end

function coc_functions.next_completion()
    if coc_pum_visible() then
        return vim.fn["coc#pum#next"](1)
    end

    return nil
end

function coc_functions.prev_completion()
    if coc_pum_visible() then
        return vim.fn["coc#pum#prev"](1)
    end

    return nil
end

function coc_functions.show_documentation()
    local current_word = vim.fn.expand("<cword>")

    if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
        return call_help(current_word)
    end

    if not h.vim_bool_call("coc#rpc#ready") then
        return call_keywordprg(current_word)
    end

    vim.fn.CocActionAsync("doHover")
end

return coc_functions
