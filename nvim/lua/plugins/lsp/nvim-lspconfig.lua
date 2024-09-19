return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",

		"hrsh7th/cmp-nvim-lsp",

		"artemave/workspace-diagnostics.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- default lsp setup
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			["rust_analyzer"] = function() end, -- using rustaceanvim
			["ts_ls"] = function() end, -- using typescript-tools
			["lua_ls"] = function() end,
			["emmet_language_server"] = function() end,
			["pyright"] = function() end,
		})

		-- setup lsp per languages
		local servers = {
			"ts_ls",
			"lua_ls",
			"emmet_language_server",
			"pyright",
		}

		for _, server in ipairs(servers) do
			local ok, config = pcall(require, "plugins.lsp.configs." .. server)
			if ok then
				config.setup_lsp(lspconfig, capabilities)
			end
		end
	end,
}
