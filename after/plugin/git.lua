vim.keymap.set('n', '<leader>sg', ':Git<CR>', { noremap = true })

local function get_commit_hash_from_line()
    local line = vim.api.nvim_get_current_line()
    local hash = line:match("^([a-f0-9]+)")
    return hash
end

local function show_diff_in_right_buffer(commit_hash, file_path)
    if not commit_hash then return end

    local current_win = vim.api.nvim_get_current_win()
    local wins = vim.api.nvim_tabpage_list_wins(0)
    local right_win = nil

    for _, win in ipairs(wins) do
        if win ~= current_win then
            right_win = win
            break
        end
    end

    if not right_win then
        vim.cmd('vsplit')
        right_win = vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(current_win)
    end

    local cmd = string.format("git show %s -- %s", commit_hash, file_path or "")
    local result = vim.fn.systemlist(cmd)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)

    local buf_opts = vim.bo[buf]
    buf_opts.filetype = 'diff'
    buf_opts.readonly = true
    buf_opts.modifiable = false

    vim.api.nvim_win_set_buf(right_win, buf)
end

local function setup_git_log_viewer()
    local file_path = vim.fn.expand('%:p')
    if file_path == '' then
        print("No file to show git log for")
        return
    end

    vim.cmd('vnew')
    local git_log_cmd = string.format('r !git log --oneline -- %s', vim.fn.shellescape(file_path))
    vim.cmd(git_log_cmd)
    vim.cmd('setlocal filetype=gitlog')
    vim.cmd('setlocal readonly')
    vim.cmd('setlocal nomodifiable')

    vim.b.git_log_file_path = file_path

    local group = vim.api.nvim_create_augroup('GitLogViewer', { clear = true })
    vim.api.nvim_create_autocmd('CursorMoved', {
        group = group,
        buffer = 0,
        callback = function()
            local hash = get_commit_hash_from_line()
            if hash then
                show_diff_in_right_buffer(hash, vim.b.git_log_file_path)
            end
        end,
    })

    local hash = get_commit_hash_from_line()
    if hash then
        show_diff_in_right_buffer(hash, vim.b.git_log_file_path)
    end
end

vim.keymap.set('n', '<leader>gl', setup_git_log_viewer, { noremap = true, desc = 'Git log with auto-diff' })
