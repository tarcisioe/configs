local function is_vim_value_true(value)
    return value ~= 0
end

local function vim_condition(condition)
    return is_vim_value_true(vim.api.nvim_eval(condition))
end

local function is_pop_up_menu_visible()
    return is_vim_value_true(vim.fn.pumvisible())
end

local vim_helpers = {}

function vim_helpers.executable(command)
    return is_vim_value_true(vim.fn.executable(command))
end

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

local function count_loaded_buffers()
    local count = {
        normal = 0,
        acwrite = 0,
        help = 0,
        nofile = 0,
        nowrite = 0,
        quickfix = 0,
        terminal = 0,
        prompt = 0,
        total = 0,
    }

    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buffer) then
            local buftype = vim.api.nvim_get_option_value("buftype", { buf = buffer })

            if buftype == "" then
                buftype = "normal"
            end

            count[buftype] = count[buftype] + 1
            count.total = count.total + 1
        end
    end

    return count
end

function vim_helpers.set(modes, lhs, rhs, options)
    if options == nil then
        options = {}
    end

    if type(modes) == "string" then
        modes = { modes }
    end

    if not options.force_remap and not options.buffer then
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

    if options.silent == nil then
        options["silent"] = true
    end

    vim.keymap.set(modes, lhs, rhs, options)
    set_keymap_for_modes(modes, lhs)
end

function vim_helpers.set_local(modes, lhs, rhs, options)
    if options == nil then
        options = {}
    end

    options["buffer"] = 0

    vim_helpers.set(modes, lhs, rhs, options)
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

function vim_helpers.go_to_last_open_position()
    local line = vim.fn.line("'\"")
    if line > 0 and line <= vim.fn.line("$") then
        vim.cmd("normal! g'\"")
    end
end

function vim_helpers.cmp_set(lhs, rhs)
    local function wrap()
        if not is_pop_up_menu_visible() then
            return lhs
        end

        if type(rhs) == "string" then
            return rhs
        end

        return rhs()
    end

    vim_helpers.set("i", lhs, wrap, { silent = true, expr = true, noremap = true })
end

function vim_helpers.confirm_completion()
    if vim.fn.complete_info().selected == -1 then
        return "<C-n><C-y>"
    end

    return "<C-y>"
end

function vim_helpers.close_current_buffer()
    if count_loaded_buffers().total == 1 then
        vim.cmd.quit()
    end

    vim.cmd.bdelete()
end

return vim_helpers
