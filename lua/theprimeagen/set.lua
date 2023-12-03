-- line numbers
vim.opt.nu = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- ?
vim.opt.smartindent = true

-- ?
vim.opt.wrap = false

-- undo tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- good colors
vim.opt.termguicolors = true

-- fast update
vim.opt.updatetime = 50

-- diagnostics
vim.diagnostic.config({
    virtual_text = false,
})

vim.api.nvim_set_keymap(
  'n', 'gy', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)

-- vim.api.nvim_set_keymap(
-- v  'n', 'gd', ':lua vim.lsp.buf.defintion()<CR>', 
-- v  { noremap = true, silent = true }
-- v)

vim.api.nvim_set_keymap(
  'n', 'gh', ':lua vim.lsp.buf.hover()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n', '<leader>st', ':NvimTreeOpen<CR>',
  { noremap = true, silent = true }
)

-- vvim.api.nvim_set_keymap(
-- v  'n', 'gr', ':lua vim.lsp.buf.references()<CR>', 
-- v  { noremap = true, silent = true }
-- v)
