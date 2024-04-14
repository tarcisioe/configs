local health = {
    errors = {},
    lua_errors = {},
}

function health.notify()
    if #health.errors > 0 or #health.lua_errors > 0 then
        vim.notify("Errors loading user configs. Run :checkhealth userconfig for more info.")
    end
end

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

function health.error(message, advice)
    table.insert(health.errors, { debug.getinfo(2,'S').source:match("[^/]*.lua$"), message, advice })
end

function health.check()
    check_errors()
    check_lua_errors()
end

return health
