local builtin = require('telescope.builtin')

-- Configure telescope for modern LSP
require('telescope').setup({
    defaults = {
        -- Configure to avoid deprecated LSP warnings
        layout_config = {
            horizontal = {
                preview_cutoff = 100,
            },
        },
    },
    pickers = {
        lsp_references = {
            show_line = false,
            include_declaration = false,
        },
    },
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)

vim.keymap.set('n', '<leader>fs', function ()
    builtin.lsp_document_symbols({
        symbols = { "Function", "Method" }
    })
end, { desc = "Jump to function/method" })
