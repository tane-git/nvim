-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr }
    lsp_zero.default_keymaps(opts)

    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "ge", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "gE", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "gc", vim.lsp.buf.code_action, opts)
    vim.keymap.set("v", "gc", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "<leader>rf", ":LspZeroFormat<CR>", opts)

    local function get_flattened_symbols(symbols)
        local flattened_symbols = {}

        local function flatten_symbols(symbols)
            for _, symbol in ipairs(symbols) do
                if symbol.kind ~= 14 then -- Exclude certain kinds, 14 is usually for strings, you might need to adjust this
                    table.insert(flattened_symbols, symbol)
                end
                if symbol.children then
                    flatten_symbols(symbol.children)
                end
            end
        end

        flatten_symbols(symbols)
        return flattened_symbols
    end

    local function goto_symbol(direction)
        local params = vim.lsp.util.make_position_params()
        local result = vim.lsp.buf_request_sync(0, "textDocument/documentSymbol", params)
        if result then
            local symbols = result[1].result
            local cursor_position = vim.api.nvim_win_get_cursor(0)
            local target_symbol = nil

            local flattened_symbols = get_flattened_symbols(symbols)

            if direction == "next" then
                for _, symbol in ipairs(flattened_symbols) do
                    if symbol.range.start.line > cursor_position[1] - 1 then
                        target_symbol = symbol
                        break
                    end
                end
            elseif direction == "prev" then
                for i = #flattened_symbols, 1, -1 do
                    local symbol = flattened_symbols[i]
                    if symbol.range.start.line < cursor_position[1] - 1 then
                        target_symbol = symbol
                        break
                    end
                end
            end

            if target_symbol then
                vim.api.nvim_win_set_cursor(0,
                    { target_symbol.range.start.line + 1, target_symbol.range.start.character })
            end
        end
    end

    local function goto_next_symbol()
        goto_symbol("next")
    end

    local function goto_prev_symbol()
        goto_symbol("prev")
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
