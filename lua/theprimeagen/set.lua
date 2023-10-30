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
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
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
