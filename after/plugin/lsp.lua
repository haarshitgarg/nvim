local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'clangd', 'lua_ls', 'html', 'pyright', 'gopls', 'ts_ls'},
	handlers = {
		lsp.default_setup,
		-- Custom handler for TypeScript
		ts_ls = function()
			vim.lsp.config('ts_ls', {})
		end,
		-- Custom handler for Go with position encoding
		gopls = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			vim.lsp.config('gopls', {
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})
		end,
		-- Custom handler for HTML with snippet support
		html = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			vim.lsp.config('html', {
				capabilities = capabilities,
				filetypes = {'html', 'jsp'},
			})
		end,
	},
})

-- Setup Swift/iOS LSP (not available via Mason)
vim.lsp.config('sourcekit', {})

--local config = {
--    cmd = {'/opt/homebrew/Cellar/jdtls/1.41.0/bin/jdtls'},
--    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
--    filetypes = {'java', 'jsp'}
--}
--require('jdtls').start_or_attach(config)

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
