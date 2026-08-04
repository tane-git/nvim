-- M-hjkl moves between vim splits, matching tmux's M-hjkl pane navigation
-- (see .tmux.conf). At the edge of vim's own splits it hands off to the
-- same script tmux itself uses for "move to the pane, or create one if none
-- exists" (~/.tmux/pane-move-or-split.sh) instead of reimplementing that
-- logic here, so both ends of the handoff stay identical.
local script = vim.fn.expand('~/.tmux/pane-move-or-split.sh')
local select_flag = { h = 'L', j = 'D', k = 'U', l = 'R' }

local function navigate(dir)
    local win_before = vim.fn.winnr()
    vim.cmd('wincmd ' .. dir)
    if vim.fn.winnr() ~= win_before then
        return -- moved within vim's own splits, nothing left to do
    end
    if not vim.env.TMUX then
        return -- not inside tmux, nothing to fall through to
    end
    vim.fn.system({ script, select_flag[dir] })
end

vim.api.nvim_create_user_command('TmuxAwareNavigate', function(opts)
    navigate(opts.args)
end, { nargs = 1 })

for _, dir in ipairs({ 'h', 'j', 'k', 'l' }) do
    vim.keymap.set('n', '<M-' .. dir .. '>', function() navigate(dir) end, { noremap = true, silent = true })
    vim.keymap.set('t', '<M-' .. dir .. '>', '<C-\\><C-n>:TmuxAwareNavigate ' .. dir .. '<CR>',
        { noremap = true, silent = true })
end
