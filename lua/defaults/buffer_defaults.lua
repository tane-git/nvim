local buffer_defaults = {
    -- go to next buffer
    next = ':bn<CR>',

    -- go to previous buffer
    previous = ':bp<CR>',

    -- go to first buffer
    first = ':bf<CR>',

    -- go to last buffer
    last = ':bl<CR>',

    -- go to buffer number N
    go_to = ':b ',

    -- list all buffers
    list = ':ls<CR>',

    -- delete current buffer
    delete = ':bd<CR>',

    -- wipe out current buffer (delete and remove from buffer list)
    wipe_out = ':bw<CR>',

    -- go to alternate buffer
    alternate = '<C-^>',

    -- go to previous buffer (same as alternate)
    previous_buffer = ':b#<CR>',

    -- create a new buffer
    new = ':enew<CR>',
}

return buffer_defaults
