local M = {}

M.setup_lsp = function(lspconfig, capabilities)
	lspconfig.pyright.setup({
		capabilities = capabilities,
		settings = {
			python = {
				analysis = {
					diagnosticMode = "workspace",
				},
			},
		},
	})
end

return M
