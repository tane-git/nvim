function ColorMyPencils(color)
	local colorSchemes = {
        "darkplus",
		"rose-pine",
		"kanagawa",
	}

	local default = colorSchemes[1]

	color = color or default

	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
