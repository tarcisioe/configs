local h = require("userconfig.health")

return function(module)
    -- This requires a module but simply outputs an error if it fails, and the
    -- rest of the configuration can keep running.
    local status, result = pcall(function() return require(module) end)

    if not status then
        table.insert(h.errors, { module, result })
        return
    end

    return result
end
