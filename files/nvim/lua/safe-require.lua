local h = require("userconfig.health")

---Requires a module, but simply returns nil if an error happens.
---Also appends the error to health.errors.
---@param module string The module to require.
---@return unknown | nil result Whatever was returned by the require, or nil if it failed.
return function(module)
    -- This requires a module but simply outputs an error if it fails, and the
    -- rest of the configuration can keep running.
    local status, result = pcall(function()
        return require(module)
    end)

    if not status then
        table.insert(h.errors, { module, result })
        return
    end

    return result
end
