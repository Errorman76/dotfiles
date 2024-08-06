local M = {}

M.setup_lsp = function(lspconfig, capabilities)
	lspconfig.emmet_language_server.setup({
		capabilities = capabilities,
	})
end

return M
