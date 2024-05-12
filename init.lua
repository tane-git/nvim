vim.g.mapleader = ' '

local keybindings = {
    ["<leader>e"] = "ViewFileTree",
    ["<leader>f"] = "anotherCommand",
}

local hotkeys = vim.g.vscode and require('hotkeys-vscode') or require('hotkeys-vim')

for key, cmd in pairs(keybindings) do
    local command = hotkeys[cmd]
    if command then
        vim.keymap.set('n', key, command)
    end
end
