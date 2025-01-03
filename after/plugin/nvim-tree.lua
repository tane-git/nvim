-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    -- vim.keymap.set('n', '<leader>st', api.tree.open, opts('Open')) -- not working?

    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
end

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    on_attach = my_on_attach,
    -- sync_root_with_cwd = true
    -- follow = true
    actions = {
        open_file = {
            resize_window = false
        }
    }
})

vim.keymap.set('n', '<leader>st', ':NvimTreeOpen<CR>', { noremap = true })
vim.keymap.set('n', '<leader>sT', ':NvimTreeFindFile<CR>', { noremap = true })
