--* Do you want a fat insert mode cursor?
-- vim.opt.guicursor = ""

--* line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--* tab stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--* indenting
vim.opt.smartindent = true

--* wrapping
vim.opt.wrap = true

--* Use undo tree instead of vim backups
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--* '/' search highlighting
-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

vim.opt.termguicolors = true

--* Stop Carat reaching top or bottom unless at top or bottom
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--* fast update time
vim.opt.updatetime = 50

--* color column
-- vim.opt.colorcolumn = "80"
