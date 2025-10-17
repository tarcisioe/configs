-- According to :h lua 5.1 is considered the permanent interface
local h = require("userconfig.health")

local rocks_config = {
    rocks_path = vim.fs.joinpath(
        vim.fn.stdpath("data") --[[@as string]], "/rocks"
    ),
}

local rocks_repo_location = vim.fs.joinpath(
    vim.fn.stdpath("cache") --[[@as string]], "rocks.nvim"
)

local rocks_url = "https://github.com/lumen-oss/rocks.nvim"

---Ensure we have a clone of rocks.nvim repo to get the bootstrap script from.
---@return boolean cloned Whether we have a clone of rocks.nvim.
local function ensure_rocks_repo()
    if vim.uv.fs_stat(rocks_repo_location) then
        return true
    end

    vim.notify("Could not find the rocks.nvim repo, cloning....")
    local result = vim.system({ "git", "clone", "--filter=blob:none", rocks_url, rocks_repo_location })

    return result:wait().code == 0
end

---Ensure that rocks.nvim is installed.
local function ensure_rocks()
    if pcall(require, "rocks") then
        return
    end

    vim.notify("rocks.nvim not installed, installing.")

    if not ensure_rocks_repo() then
        h.error("Error cloning rocks.nvim repository.", {
            ("Check if Git is properly installed in your system."),
        })
        return
    end

    vim.cmd.source(vim.fs.joinpath(rocks_repo_location, "bootstrap.lua"))
    vim.fn.delete(rocks_repo_location, "rf")

    vim.notify("Finished installing rocks.nvim! Run `Rocks sync` to install all plugins.")
end

local function setup_rocks()
    vim.g.rocks_nvim = rocks_config

    local luarocks_path = {
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
    }

    local luarocks_cpath = {
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    }

    package.path = package.path .. ";" .. table.concat(luarocks_path, ";")
    package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

    vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))

    ensure_rocks()
end

setup_rocks()
