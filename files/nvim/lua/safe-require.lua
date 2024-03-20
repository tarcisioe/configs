return function(module)
    local status, result = pcall(function() require(module) end)

    if not status then
        vim.notify(
            ("Error while requiring module %s: %s"):format(module, tostring(result)),
            vim.log.levels.ERROR
        )
        return
    end

    return result
end
