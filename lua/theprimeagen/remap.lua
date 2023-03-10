vim.g.mapleader = " "
vim.keymap.set("n", "<leader>sf", vim.cmd.Ex, { desc = 'see files' })

--* Moves Visual Selection blocks (if statement is just there for demo of auto indenting)
if true then
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
end

--* Keeps Carat in same place during line concats ("J")
vim.keymap.set("n", "J", "mzJ`z")

--* Center Carat after page scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


--* search terms staay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--* greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

--* next greatest remap ever : asbjornHaland
-- crash your WSL with this one!
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--* Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

--* DONT USE Q?
vim.keymap.set("n", "Q", "<nop>")

--* TMUX
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--* Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--* Quick fix stuff
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--* rename current word
vim.keymap.set("n", "<leader>c", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
