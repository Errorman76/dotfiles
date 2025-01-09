local M = {}

M.setup_lsp = function(lspconfig, capabilities)
	lspconfig.ts_ls.setup({
		capabilities = capabilities,
		settings = {
			javascript = {
				updateImportsOnFileMove = {
					enabled = "always",
				},
			},
			typescript = {
				updateImportsOnFileMove = {
					enabled = "always",
				},
			},
		},
		commands = {
			OrganizeImports = {
				function()
					vim.lsp.buf.execute_command({
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
						title = "",
					})
				end,
				description = "Organize imports",
			},
		},
		on_attach = function(client, bufnr)
			require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
		end,
	})
end

return M
