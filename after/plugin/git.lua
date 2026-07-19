vim.api.nvim_set_keymap('n', '<leader>sg', ':Git<CR>', { noremap = true })

local git_layout = {
    git_log_win = nil,
    commit_details_win = nil,
    diff_win = nil
}

local function create_git_layout()
    vim.cmd('tabnew')
    vim.cmd('vsplit')
    vim.cmd('split')

    local all_wins = vim.api.nvim_tabpage_list_wins(0)

    -- Find windows by position
    for _, win in ipairs(all_wins) do
        local row, col = unpack(vim.api.nvim_win_get_position(win))

        if col == 0 then
            -- Left column windows - determine by row
            if not git_layout.git_log_win then
                git_layout.git_log_win = win
            else
                -- Second window in left column is commit details
                git_layout.commit_details_win = win
            end
        else
            -- Right column window is diff
            git_layout.diff_win = win
        end
    end

    vim.api.nvim_set_current_win(git_layout.git_log_win)
end

local function get_commit_hash_from_line()
    local line_num = vim.api.nvim_win_get_cursor(0)[1]
    return vim.b.git_hash_mapping and vim.b.git_hash_mapping[line_num]
end

local function show_diff_in_right_buffer(commit_hash, file_path)
    if not commit_hash or not git_layout.diff_win then return end

    local cmd = string.format("git diff %s^..%s -- %s", commit_hash, commit_hash, file_path or "")
    local result = vim.fn.systemlist(cmd)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)

    local buf_opts = vim.bo[buf]
    buf_opts.filetype = 'diff'
    buf_opts.readonly = true
    buf_opts.modifiable = false

    vim.api.nvim_win_set_buf(git_layout.diff_win, buf)

    vim.wo[git_layout.diff_win].number = false
    vim.wo[git_layout.diff_win].relativenumber = false
    vim.wo[git_layout.diff_win].fillchars = 'eob: '
    vim.wo[git_layout.diff_win].statusline = ' '
end

local function show_commit_details_in_bottom_buffer(commit_hash)
    if not commit_hash or not git_layout.commit_details_win then return end

    local cmd = string.format("git show --stat %s", commit_hash)
    local result = vim.fn.systemlist(cmd)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)

    local buf_opts = vim.bo[buf]
    buf_opts.filetype = 'gitcommit'
    buf_opts.readonly = true
    buf_opts.modifiable = false

    vim.api.nvim_win_set_buf(git_layout.commit_details_win, buf)

    vim.wo[git_layout.commit_details_win].number = false
    vim.wo[git_layout.commit_details_win].relativenumber = false
    vim.wo[git_layout.commit_details_win].fillchars = 'eob: '
    vim.wo[git_layout.commit_details_win].statusline = ' '
end

local function setup_git_log_viewer()
    local file_path = vim.fn.expand('%:p')
    if file_path == '' then
        print("No file to show git log for")
        return
    end

    create_git_layout()

    local git_log_cmd = string.format('git log --pretty=format:"%%h|%%s" -- %s', vim.fn.shellescape(file_path))
    local git_output = vim.fn.systemlist(git_log_cmd)

    local hash_mapping = {}
    local clean_messages = {}

    for i, line in ipairs(git_output) do
        local hash, message = line:match("^([a-f0-9]+)|(.*)$")
        if hash and message then
            hash_mapping[i] = hash
            table.insert(clean_messages, message)
        end
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, clean_messages)
    vim.cmd('setlocal filetype=gitlog')
    vim.cmd('setlocal readonly')
    vim.cmd('setlocal nomodifiable')

    vim.wo[git_layout.git_log_win].number = false
    vim.wo[git_layout.git_log_win].relativenumber = false
    vim.wo[git_layout.git_log_win].fillchars = 'eob: '
    vim.wo[git_layout.git_log_win].statusline = ' '

    vim.b.git_log_file_path = file_path
    vim.b.git_hash_mapping = hash_mapping

    local group = vim.api.nvim_create_augroup('GitLogViewer', { clear = true })
    vim.api.nvim_create_autocmd('CursorMoved', {
        group = group,
        buffer = 0,
        callback = function()
            local hash = get_commit_hash_from_line()
            if hash then
                show_diff_in_right_buffer(hash, vim.b.git_log_file_path)
                show_commit_details_in_bottom_buffer(hash)
            end
        end,
    })

    local hash = get_commit_hash_from_line()
    if hash then
        show_diff_in_right_buffer(hash, vim.b.git_log_file_path)
        show_commit_details_in_bottom_buffer(hash)
    end
end

vim.api.nvim_set_keymap('n', '<leader>gl', ':lua setup_git_log_viewer()<CR>', { noremap = true })

-- Make the function global so it can be called from the keymap
_G.setup_git_log_viewer = setup_git_log_viewer
