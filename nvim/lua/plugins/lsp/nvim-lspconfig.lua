return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",

		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- user modules
		local config_rust = require("plugins.lsp.configs.rust")
		local config_lua = require("plugins.lsp.configs.lua")

		-- plugins
		-- The servers and set up each one with the same capabilities
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- default setup
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			-- using rustaceanvim
			["rust_analyzer"] = config_rust.setup_lsp,
		})

		-- lus_ls setup
		config_lua.setup_lsp(lspconfig, capabilities)
	end,
}
