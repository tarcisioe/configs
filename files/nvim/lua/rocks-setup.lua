-- According to :h lua 5.1 is considered the permanent interface
local vh = require("vim-helpers")
local h = require("userconfig.health")

local rocks_config = {
    rocks_path = vim.fn.stdpath("data") .. "/rocks",
    luarocks_binary = "luarocks",
}

if not vh.executable(rocks_config.luarocks_binary) then
    h.error("Luarocks not found, cannot configure rocks.nvim.", { "Install luarocks." })
    return
end

local function run_luarocks(args)
    return vim.system({
        rocks_config.luarocks_binary,
        "--lua-version=5.1",
        ("--tree=%s"):format(rocks_config.rocks_path),
        unpack(args),
    })
end

local function install_rocks_nvim()
    if run_luarocks({ "which", "rocks" }):wait().code ==0 then
        return true
    end

    local install_rocks = run_luarocks({ "install", "rocks.nvim" })
    vim.notify("rocks.nvim not installed, installing.")

    local exit_code = install_rocks:wait().code

    if exit_code ~= 0 then
        h.error(
            "Error installing rocks.nvim.",
            {
                ("Clean the tree at '%s' and try again."):format(
                    rocks_config.rocks_path
                )
            }
        )
        return false
    end

    vim.notify("Finished installing rocks.nvim! Run `Rocks sync` to install all plugins.")
    return true
end

if not install_rocks_nvim() then
    return
end

local luarocks_path = {
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}

local luarocks_cpath = {
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
}

vim.g.rocks_nvim = rocks_config
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))
