local bufCmds = require('defaults.buffer_defaults')

local mappings = {
    ['<leader>ba'] = bufCmds.alternate,
    ['<leader>bL'] = bufCmds.list,
    ['<leader>bn'] = bufCmds.new,
    ['<leader>bj'] = bufCmds.previous,
    ['<leader>bk'] = bufCmds.next,
    ['<leader>bh'] = bufCmds.first,
    ['<leader>bl'] = bufCmds.last,
}

for key, cmd in pairs(mappings) do
    vim.keymap.set('n', key, cmd, { noremap = true })
end
