local winCmds = require('defaults.window_defaults')

local mappings = {
    -- Movement
    ['<leader>wh']  = winCmds.left,
    ['<leader>wj']  = winCmds.down,
    ['<leader>wk']  = winCmds.up,
    ['<leader>wl']  = winCmds.right,

    -- probably dont need as can just navigate with basic movements above
    ['<leader>wp']  = winCmds.go_previous,
    -- ['<leader$wp']  = winCmds.go_previous_window,
    -- ['<leader>wb']  = winCmds.go_bottom,
    -- ['<leader>wt']  = winCmds.go_top,

    ['<leader>wH']  = winCmds.move_left,
    ['<leader>wJ']  = winCmds.move_bottom,
    ['<leader>wK']  = winCmds.move_top,
    ['<leader>wL']  = winCmds.move_right,

    -- Sizing
    ['<leader>wf']  = winCmds.maximize,
    ['<leader>we']  = winCmds.equalize,
    ['<leader>wt']  = winCmds.taller,
    ['<leader>wT']  = winCmds.shorter,
    ['<leader>ww']  = winCmds.wider,
    ['<leader>wW']  = winCmds.thinner,
    ['<leader>wi']  = winCmds.set_width, -- width [i]s...

    -- Tabs
    ['<leader>tn']  = winCmds.move_new_tab,
    ['<leader>tl']  = winCmds.go_next_tab,
    ['<leader>th']  = winCmds.go_previous_tab,
    ['<leader>tp']  = winCmds.go_last_accessed_tab,

    -- Rotating
    ['<leader>wR']  = winCmds.rotate_up,
    ['<leader>wr']  = winCmds.rotate_down,

    -- Closing
    ['<leader>wc']  = winCmds.close,
    ['<leader>wo']  = winCmds.close_all_but_current,

    -- Preview
    ['gp']  = winCmds.show_tag_preview,
    ['gP']  = winCmds.go_preview,
    ['<leader>wz']  = winCmds.close_preview,

    -- Splitting
    ['<leader>ws']  = winCmds.split,
    ['<leader>wsv'] = winCmds.split_vertical,
    ['<leader>wsh'] = winCmds.split_horizontal,
    ['<leader>wsp'] = winCmds.split_preview_tag,
    ['<leader>wsj'] = winCmds.split_jump_tag,
    ['<leader>wst'] = winCmds.split_tjump_tag,
    ['<leader>wss'] = winCmds.split_tselect_tag,
    ['<leader>wd']  = winCmds.split_jump_definition,
    ['<leader>wD']  = winCmds.split_jump_declaration,
    ['<leader>wsa'] = winCmds.split_edit_alternate, -- not sure how these would be used/useful?
    ['<leader>wsf'] = winCmds.split_edit_file,      -- maybe useful if you see file names in file contents and want to split/jump
    ['<leader>wsF'] = winCmds.split_edit_file_jump,

    -- Other
    ['<leader>wn']  = winCmds.open_new,
    ['<leader>wq']  = winCmds.quit,
    ['<leader>wx']  = winCmds.exchange_window,
}

for key, cmd in pairs(mappings) do
    vim.keymap.set('n', key, cmd, { noremap = true })
end
