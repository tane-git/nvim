-- ~~ GENERAL ~~
vim.g.mapleader = " "


-- ~~ IDE NAVIGATION ~~
vim.keymap.set("n", "<leader>sf", vim.cmd.Ex)


-- edit vim config
vim.api.nvim_set_keymap('n', '<Leader>ve', ':e ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })


-- ~~ FILE NAVIGATION ~~
vim.keymap.set('n', '<C-j>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('v', '<C-j>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('v', '<C-k>', '<C-u>zz', { noremap = true, silent = true })

-- Swap { and } (which are under the j/k keys on a symbols layer)
vim.keymap.set({'n', 'v'}, '{', '}', { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '}', '{', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-i>', '<C-i>', { noremap = true, silent = true })


-- ~~ TEXT EDITING ~~
-- Move with selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- WHEN appending lines THEN cursor stays in one place
vim.keymap.set("n", "J", "mzJ`z")

-- Use void register
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Highlight all
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


-- ~~ SEARCHING ~~
-- WHEN searching THEN cursor stays in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- ~~ RUN SHIT ~~
vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format)

-- ~~ Terminal ~~
-- vim.keymap.set('t', '<C-Space>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<S-Esc>', '<Esc>', { noremap = true, silent = true })

-- ~~ EXAMPLES ~~

-- vim.keymap.set("n", "<leader>vwm", function()
--  require("vim-with-me").StartVimWithMe()
-- end)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- TMUX
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- dont press Q?
-- vim.keymap.set("n", "Q", "<nop>")

