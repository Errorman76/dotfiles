local M = {}

--- lua_ls lsp setup
--- @param lspconfig any nvim-lspconfig
--- @param capabilities any cmp_nvim_lsp
M.setup_lsp = function(lspconfig, capabilities)
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
end

return M
