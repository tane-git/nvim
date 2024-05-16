-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr}

  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps(opts)

  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "ge", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "gE", vim.diagnostic.goto_prev, opts)

  local function copy_symbols_to_clipboard()
        local params = vim.lsp.util.make_position_params()
        local result = vim.lsp.buf_request_sync(0, "textDocument/documentSymbol", params)
        if result then
            local symbols = result[1].result
            local symbol_names = {}
            for _, symbol in ipairs(symbols) do
                table.insert(symbol_names, symbol.name)
            end
            local clipboard_text = table.concat(symbol_names, ", ")
            vim.fn.setreg("+", clipboard_text)
            print("Copied symbol names to clipboard")
        else
            print("Failed to retrieve symbols")
        end
    end

    vim.keymap.set("n", "<leader>rs", copy_symbols_to_clipboard, opts)
end)


require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

local lua_opts = lsp_zero.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)

