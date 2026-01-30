require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})

-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-doesnt-exist")
-- vim.cmd("colorscheme rose-pine")
vim.cmd("colorscheme catppuccin")

-- Git diff colors
local green = "#a6e3a1"
local yellow = "#f9e2af"
local red = "#f38ba8"
local blue = "#89b4fa"
local dark_green = "#1e3a2e"
local dark_yellow = "#3e3a1e"
local dark_red = "#3e1e2e"
local dark_blue = "#1e2a3e"

-- Gitsigns highlight groups - must be AFTER colorscheme to override Catppuccin's grey colors
-- Sign column highlights
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = green })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = yellow })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = red })
vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = red })
vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = red })
vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = blue })

-- Number highlighting (numhl=true)
vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = green })
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = yellow })
vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = red })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { fg = red })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { fg = red })
vim.api.nvim_set_hl(0, "GitSignsUntrackedNr", { fg = blue })

-- Line highlighting (linehl=true)
vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = dark_green })
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = dark_yellow })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { bg = dark_red })
vim.api.nvim_set_hl(0, "GitSignsUntrackedLn", { bg = dark_blue })

-- Override base Diff groups that gitsigns falls back to
vim.api.nvim_set_hl(0, "DiffAdd", { bg = dark_green })
vim.api.nvim_set_hl(0, "DiffChange", { bg = dark_yellow })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = dark_red })
