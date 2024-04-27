local set_local = require("vim-helpers").set_local

local function get_parent_class_node(node)
     while node do
        if node:type() == 'class_definition' then
            break
        end

        node = node:parent()
    end

    return node
end

local function get_class_identifier_node(class_node)
    return class_node:named_child(0)
end

---@return string | nil
local function get_current_class()
    local node = vim.treesitter.get_node({})

    local parent_class_node = get_parent_class_node(node)

    if parent_class_node == nil then
        return nil
    end

    local class_identifier_node = get_class_identifier_node(parent_class_node)

    return vim.treesitter.get_node_text(class_identifier_node, 0)
end

local function get_current_file_path()
    return vim.api.nvim_buf_get_name(0)
end

---@return string[] | nil
local function make_manim_command()
    local current_class = get_current_class()

    if current_class == nil then
        return nil
    end

    return {
        "manim",
        "-p",
        get_current_file_path(),
        current_class,
    }
end

local function run_current_manim_animation()
    local command = make_manim_command()

    if command == nil then
        vim.notify("No command generated. Maybe not inside a class?")
        return
    end

    return vim.system(command)
end

set_local("n", "<leader>m", run_current_manim_animation)
