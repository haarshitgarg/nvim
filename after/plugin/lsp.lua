local lsp = require("lsp-zero")
require('lspconfig').lua_ls.setup({})
-- tutorial: https://lsp-zero.netlify.app/v3.x/tutorial.html

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'clangd', 'lua_ls'},
	handlers = {
		lsp.default_setup,
	},
})

require('lspconfig').clangd.setup({})
require('lspconfig').sourcekit.setup({})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  })
})
