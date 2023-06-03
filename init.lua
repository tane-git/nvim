-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

-- <LazyNeoVim>
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

-- </LazyNeoVim>


local plugins = {
	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  dependencies = {
	    "nvim-tree/nvim-web-devicons",
	  },
	  config = function()
	    require("nvim-tree").setup {
		renderer = {
			icons = {
				  show = {
					    file = false,
					    folder = false,
					    folder_arrow = true,
					    git = true,
					    modified = true,
				  }
			}
		}
	    }
	  end,
	},

        {
		    "williamboman/mason.nvim",
		    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	}
}

require("lazy").setup(plugins, opts)

require("mason").setup()


-- <KeyBindings>
vim.api.nvim_set_keymap('n', '<leader>sf', ':Ex<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>st', ':NvimTreeToggle<CR>', {noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sT', ':NvimTreeFindFile<CR>', {noremap = true })
-- </KeyBindings>

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { buffer = args.buf })
  end,
})

-- From ThePrimeagen:
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
