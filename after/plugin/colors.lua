function Catppucin()
    require("catppuccin").setup({
        flavour = "mocha",
        -- flavour = "latte",
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true
    })
end

function Sync_OS_Theme()
    local color_scheme = os.getenv("COLOR_SCHEME")
    if color_scheme == "dark" then
      vim.api.nvim_command("set background=dark")
    else
      vim.api.nvim_command("set background=light")
    end
end

function Theme(color)
    local themes = {
        'rose-pine',
        'onedark',
        'catppuccin'
    }
    -- note that color does not have to be in themes array unless you want to set it as default

   local default = themes[3]


   --* Set up color themes
   -- (optional, but must be done before vim.cmd.colorshcheme)
   Catppucin()

	vim.cmd.colorscheme(color or default)

	-- todo: sync with os theme?
	-- and get a light theme to match os light theme

    --* disable background?
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
Theme()
