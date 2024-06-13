local cmp = require 'cmp'

cmp.setup({
    mapping = {
        -- Change <Tab> to confirm selection and <S-Tab> to abort
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<S-Tab>'] = cmp.mapping.abort(),

        -- Map up and down arrow keys to navigate the completion list
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        -- Toggle documentation for the currently selected auto complete option
        ['<C-d>'] = cmp.mapping(function()
            if cmp.visible_docs() then
                cmp.close_docs()
            else
                cmp.open_docs()
            end
        end, { 'i', 'c' }),
    },

    view = {
        docs = {
            auto_open = false
        }
    }
})
