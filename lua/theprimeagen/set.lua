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
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- good colors
vim.opt.termguicolors = true

-- fast update
vim.opt.updatetime = 50
