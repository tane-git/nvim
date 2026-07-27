require('neogit').setup {
    graph_style = "unicode",
}

vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = "Open Neogit UI" })
