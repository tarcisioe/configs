---Check if a value returned by a vim boolean function is true.
---@param value integer A value returned by a vim function that has a boolean return.
---@return boolean
local function is_vim_value_true(value)
    return value ~= 0
end

---Check a boolean condition with vim through nvim_eval.
---@param condition string A viml condition to check with eval.
---@return boolean
local function vim_condition(condition)
    return is_vim_value_true(vim.api.nvim_eval(condition))
end

---Check if the pop-up menu is visible.
---@return boolean
local function is_pop_up_menu_visible()
    return is_vim_value_true(vim.fn.pumvisible())
end

local vim_helpers = {}

---Check if a command is executable
---@param command string A candidate shell command/executable.
---@return boolean
function vim_helpers.executable(command)
    return is_vim_value_true(vim.fn.executable(command))
end

---Toggle whitespace markers in vim.
function vim_helpers.toggle_whitespace()
    vim.o.list = not vim.o.list
end

---Toggle line numbers in vim.
function vim_helpers.toggle_line_numbers()
    vim.o.number = not vim.o.number
end

---Toggle whether to show line numbers as relative or absolute.
function vim_helpers.toggle_relative_line_numbers()
    vim.o.rnu = not vim.o.rnu
end

---@alias modes "i" | "n" | "v"
---@alias keymap { [string]: true }
---@type { [modes]: keymap }
local _user_keymaps = {}

---Get user-defined keymaps for a given vim mode.
---@param mode modes The mode to get keymaps for.
---@return keymap
local function get_keymaps_for_mode(mode)
    if not _user_keymaps[mode] then
        _user_keymaps[mode] = {}
    end

    return _user_keymaps[mode]
end

---Mark a keymap as set for a given set of modes.
---@param modes modes[] Which modes to set the keymap on.
---@param keymap string Which keymap to mark as set.
local function set_keymap_for_modes(modes, keymap)
    for _, mode in ipairs(modes) do
        get_keymaps_for_mode(mode)[keymap] = true
    end
end

---@class (exact) BufferCount
---@field normal integer
---@field acwrite integer
---@field help integer
---@field nofile integer
---@field nowrite integer
---@field quickfix integer
---@field terminal integer
---@field prompt integer
---@field total integer

---Count how many buffers are currently loaded.
---@return BufferCount
local function count_loaded_buffers()
    ---@type BufferCount
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

---@class (exact) Opts : vim.keymap.set.Opts
---@field force_remap? boolean Whether to force overwriting a previous keymap.

---Set a keymap for a given set of modes.
---@param modes modes | modes[] Which modes to set the keymap on.
---@param lhs string Which keymap to set.
---@param rhs string | function What the keymap should execute.
---@param options? Opts Which options to use when setting the keymap.
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

    options.force_remap = nil

    if options.silent == nil then
        options.silent = true
    end

    vim.keymap.set(modes, lhs, rhs, options)
    set_keymap_for_modes(modes, lhs)
end

---Set a keymap locally (on the current buffer)
---@param modes modes | modes[] Which modes to set the keymap on.
---@param lhs string Which keymap to set.
---@param rhs string | function What the keymap should execute.
---@param options? Opts Which options to use when setting the keymap.
function vim_helpers.set_local(modes, lhs, rhs, options)
    if options == nil then
        options = {}
    end

    options.buffer = 0

    vim_helpers.set(modes, lhs, rhs, options)
end

---Check whether the current terminal is the linux text terminal.
---@return boolean
function vim_helpers.is_linux_terminal()
    return vim_condition("&term =~ 'linux'")
end

---Wrap a function to return a given key if it returns nil.
---@param fn function The function to be wrapped.
---@param key string The key to return.
---@return function
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

--- Go to the last open position in a file.
function vim_helpers.go_to_last_open_position()
    local line = vim.fn.line("'\"")
    if line > 0 and line <= vim.fn.line("$") then
        vim.cmd("normal! g'\"")
    end
end

---Set a keymap wrapping its handler to run only if a completion is running.
---@param lhs string The keymap to set.
---@param rhs string | function The handler for the keymap.
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

---Confirm a completion.
---@return string
function vim_helpers.confirm_completion()
    if vim.fn.complete_info().selected == -1 then
        return "<C-n><C-y>"
    end

    return "<C-y>"
end

---Close the current buffer.
function vim_helpers.close_current_buffer()
    if count_loaded_buffers().total == 1 then
        vim.cmd.quit()
    end

    vim.cmd.bdelete()
end

return vim_helpers
