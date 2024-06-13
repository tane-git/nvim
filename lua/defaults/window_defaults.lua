-- Default hotkeys and documentation from `:help index` -> Window Commands
local window_defaults = {
    -- go to Nth left window (stop at first window)
    left = '<C-w>h',

    -- go N windows down (stop at last window)
    down = '<C-w>j',

    -- go N windows up (stop at first window)
    up = '<C-w>k',

    -- go to Nth right window (stop at last window)
    right = '<C-w>l',

    -- set current window height to N (default: very high)
    maximize = '<C-w>_',

    -- make all windows the same height & width
    equalize = '<C-w>=',

    -- close current window (like |:close|)
    close = '<C-w>c',

    -- increase current window height N lines
    taller = '<C-w>+',

    -- decrease current window height N lines
    shorter = '<C-w>-',

    -- decrease current window width N columns
    thinner = '<C-w><',

    -- increase current window width N columns
    wider = '<C-w>>',

    -- move current window to the far left
    move_left = '<C-w>H',

    -- move current window to the very bottom
    move_bottom = '<C-w>J',

    -- move current window to the very top
    move_top = '<C-w>K',

    -- move current window to the far right
    move_right = '<C-w>L',

    -- go to preview window
    go_preview = '<C-w>P',

    -- rotate windows upwards N times
    rotate_up = '<C-w>R',

    -- same as "CTRL-W s"
    split = '<C-w>S',

    -- move current window to a new tab page
    move_new_tab = '<C-w>T',

    -- go to N previous window (wrap around)
    go_previous = '<C-w>W',

    -- split window and jump to tag under cursor
    split_jump_tag = '<C-w>]',

    -- split current window and edit alternate file N
    split_edit_alternate = '<C-w>^',

    -- go to bottom window
    go_bottom = '<C-w>b',

    -- split window and jump to definition under the cursor
    split_jump_definition = '<C-w>d',

    -- split window and edit file name under the cursor
    split_edit_file = '<C-w>f',

    -- split window and edit file name under the cursor and jump to the line number following the file name.
    split_edit_file_jump = '<C-w>F',

    -- split window and do |:tjump| to tag under cursor
    split_tjump_tag = '<C-w>g]',

    -- split window and do |:tselect| for tag under cursor
    split_tselect_tag = '<C-w>g]',

    -- do a |:ptjump| to the tag under the cursor
    split_preview_tag = '<C-w>g}',

    -- edit file name under the cursor in a new tab page
    edit_file_new_tab = '<C-w>gf',

    -- edit file name under the cursor in a new tab page and jump to the line number following the file name.
    edit_file_new_tab_jump = '<C-w>gF',

    -- same as `gt`: go to next tab page
    go_next_tab = '<C-w>gt',

    -- same as `gT`: go to previous tab page
    go_previous_tab = '<C-w>gT',

    -- same as |g<Tab>|: go to last accessed tab page
    go_last_accessed_tab = '<C-w>g<Tab>',

    -- split window and jump to declaration of identifier under the cursor
    split_jump_declaration = '<C-w>i',

    -- open new window, N lines high
    open_new = '<C-w>n',

    -- close all but current window (like |:only|)
    close_all_but_current = '<C-w>o',

    -- go to previous (last accessed) window
    go_previous_window = '<C-w>p',

    -- quit current window (like |:quit|)
    quit = '<C-w>q',

    -- rotate windows downwards N times
    rotate_down = '<C-w>r',

    -- split current window in two parts, new window N lines high
    split_horizontal = '<C-w>s',

    -- go to top window
    go_top = '<C-w>t',

    -- split current window vertically, new window N columns wide
    split_vertical = '<C-w>v',

    -- exchange current window with window N (default: next window)
    exchange_window = '<C-w>x',

    -- close preview window
    close_preview = '<C-w>z',

    -- set window width to N columns
    set_width = '<C-w>|',

    -- show tag under cursor in preview window
    show_tag_preview = '<C-w>}',
}

return window_defaults
