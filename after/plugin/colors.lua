function Theme(color)
    local themes = {
        'rose-pine',
        'onedark',
        'catppuccin'
    }
    -- note that color does not have to be in themes array unless you want to set it as default

   local default = themes[2]

	vim.cmd.colorscheme(color or default)

    --* disable background?
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Theme()
