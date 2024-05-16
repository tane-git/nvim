-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr }

    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps(opts)

    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "ge", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "gE", vim.diagnostic.goto_prev, opts)

    local function goto_next_symbol()
        local params = vim.lsp.util.make_position_params()
        local result = vim.lsp.buf_request_sync(0, "textDocument/documentSymbol", params)
        if result then
            local symbols = result[1].result
            local cursor_position = vim.api.nvim_win_get_cursor(0)
            local all_symbols = {}

            local function collect_symbols(symbols)
                for _, symbol in ipairs(symbols) do
                    table.insert(all_symbols, symbol)
                    if symbol.children then
                        collect_symbols(symbol.children)
                    end
                end
            end

            collect_symbols(symbols)

            table.sort(all_symbols, function(a, b)
                return a.range.start.line < b.range.start.line
            end)

            for i, symbol in ipairs(all_symbols) do
                if symbol.range.start.line > cursor_position[1] then
                    vim.api.nvim_win_set_cursor(0, { symbol.range.start.line + 1, symbol.range.start.character })
                    return
                end
            end
        end
    end

    local function goto_prev_symbol()
        local params = vim.lsp.util.make_position_params()
        local result = vim.lsp.buf_request_sync(0, "textDocument/documentSymbol", params)
        if result then
            local symbols = result[1].result
            local cursor_position = vim.api.nvim_win_get_cursor(0)
            local all_symbols = {}

            local function collect_symbols(symbols)
                for _, symbol in ipairs(symbols) do
                    table.insert(all_symbols, symbol)
                    if symbol.children then
                        collect_symbols(symbol.children)
                    end
                end
            end

            collect_symbols(symbols)

            table.sort(all_symbols, function(a, b)
                return a.range.start.line < b.range.start.line
            end)

            for i = #all_symbols, 1, -1 do
                local symbol = all_symbols[i]
                if symbol.range.start.line < cursor_position[1] then
                    vim.api.nvim_win_set_cursor(0, { symbol.range.start.line + 1, symbol.range.start.character })
                    return
                end
            end
        end
    end
    vim.keymap.set("n", "gm", goto_next_symbol, opts)
    vim.keymap.set("n", "gM", goto_prev_symbol, opts)
end)


require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
    },
})

local lua_opts = lsp_zero.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)
