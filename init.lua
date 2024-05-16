require("set") -- local file
vim.keymap.set('n', '<C-j>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('v', '<C-j>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', '<C-u>zz', { noremap = true, silent = true })
require("remap") -- local file

-- bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- { "miikanissi/modus-themes.nvim", priority = 1000 },
    { "rose-pine/neovim", name = "rose-pine" },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    "nvim-tree/nvim-tree.lua",

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
}

require("lazy").setup(plugins)

-- vim.cmd([[colorscheme modus]])

-- Copy and pasted from github/tree-sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  },
}
