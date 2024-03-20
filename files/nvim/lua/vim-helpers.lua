local function is_vim_value_true(value)
    return value ~= 0
end

local function vim_condition(condition)
    return is_vim_value_true(
        vim.api.nvim_eval(condition)
    )
end

local function vim_bool_call(function_name)
    return is_vim_value_true(vim.fn[function_name]())
end

local function check_backspace()
    local col = vim.fn.col(".") - 1

    return (col == 0) or (vim.fn.getline("."):sub(col,col):match("%s") ~= nil)
end

local function coc_pum_visible()
    return vim_bool_call("coc#pum#visible")
end

local function call_help(word)
    return vim.cmd("h " .. word)
end

local function call_keywordprg(word)
    return vim.cmd("!" .. vim.o.keywordprg .. " " .. word)
end

local vim_helpers = {}

function vim_helpers.toggle_whitespace()
    vim.o.list = not vim.o.list
end

function vim_helpers.toggle_line_numbers()
    vim.o.number = not vim.o.number
end

function vim_helpers.toggle_relative_line_numbers()
    vim.o.rnu = not vim.o.rnu
end

local _user_keymaps = {}

local function get_keymaps_for_mode(mode)
    if not _user_keymaps[mode] then
        _user_keymaps[mode] = {}
    end

    return _user_keymaps[mode]
end

local function set_keymap_for_modes(modes, keymap)
    for _, mode in ipairs(modes) do
        get_keymaps_for_mode(mode)[keymap] = true
    end
end

function vim_helpers.set(modes, lhs, rhs, options)
    if options == nil then
        options = {}
    end

    if type(modes) == "string" then
        modes = { modes }
    end

    if not options.force_remap then
        local already_mapped = {}
        for _, mode in ipairs(modes) do
            if get_keymaps_for_mode(mode)[lhs] then
                table.insert(already_mapped, mode)
            end
        end

        if #already_mapped > 0 then
            vim.notify(
                string.format(
                    "Keymap '%s' already mapped by user for modes: { '%s' }. %s",
                    lhs,
                    table.concat(already_mapped, "', '"),
                    "If you are sure you want to override the mapping, pass the option 'force_remap' as true."
                ),
                vim.log.levels.ERROR
            )
            return
        end
    end

    options["force_remap"] = nil
    options["silent"] = true

    vim.keymap.set(modes, lhs, rhs, options)
    set_keymap_for_modes(modes, lhs)
end

function vim_helpers.is_linux_terminal()
    return vim_condition("&term =~ 'linux'")
end

function vim_helpers.or_key(fn, key)
    local function _inner()
        local result = fn()

        if result == nil then
            return key
        end

        return result
    end

    return _inner
end

function vim_helpers.confirm_completion()
    if coc_pum_visible() then
        return vim.fn["coc#pum#confirm"]()
    end

    if not check_backspace() then
        return vim.fn["coc#refresh"]()
    end

    return nil
end

function vim_helpers.next_completion()
    if coc_pum_visible() then
        return vim.fn["coc#pum#next"](1)
    end

    return nil
end

function vim_helpers.prev_completion()
    if coc_pum_visible() then
        return vim.fn["coc#pum#prev"](1)
    end

    return nil
end

function vim_helpers.show_documentation()
    local current_word = vim.fn.expand("<cword>")

    if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
        return call_help(current_word)
    end

    if not vim_bool_call("coc#rpc#ready") then
        return call_keywordprg(current_word)
    end

    vim.fn.CocActionAsync("doHover")
end

function vim_helpers.go_to_last_open_position()
    local line = vim.fn.line("'\"")
    if line > 0 and line <= vim.fn.line("$") then
        vim.cmd("normal! g'\"")
    end
end

return vim_helpers
