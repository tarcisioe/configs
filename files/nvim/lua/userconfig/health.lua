local health = {
    errors = {},
    lua_errors = {},
}

---Show the user a notification if any error was registered during startup.
function health.notify()
    if #health.errors > 0 or #health.lua_errors > 0 then
        vim.notify("Errors loading user configs. Run :checkhealth userconfig for more info.")
    end
end

---Do the health check for user-registered errors.
local function check_errors()
    vim.health.start("Errors while loading config")

    if #health.errors == 0 then
        vim.health.ok("All good :)")
        return
    end

    for _, err in ipairs(health.errors) do
        local file, message, advice = unpack(err)

        vim.health.error(("'%s': %s"):format(file, message), advice)
    end
end

---Do the health check for errors found by `safe-require`.
local function check_lua_errors()
    vim.health.start("Lua errors while loading config")

    if #health.lua_errors == 0 then
        vim.health.ok("All good :)")
        return
    end

    for _, err in ipairs(health.lua_errors) do
        local file, error = unpack(err)

        vim.health.error(("'%s.lua': '%s'"):format(file, error))
    end
end

local function file_name(stackpos)
    stackpos = stackpos + 1

    return debug.getinfo(stackpos, "S").source:match("[^/]*.lua$")
end

---Insert an error to be reported on `:checkhealth`.
---@param message string The error message to show.
---@param advice string[] A list of advice to show.
function health.error(message, advice)
    table.insert(health.errors, { file_name(2), message, advice })
end

---Perform the health checks. Required by neovim.
function health.check()
    check_errors()
    check_lua_errors()
end

return health
