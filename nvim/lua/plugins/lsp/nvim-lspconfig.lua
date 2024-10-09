return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",

		"hrsh7th/cmp-nvim-lsp",
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

			["lua_ls"] = function() end,
			["pyright"] = function() end,
			["rust_analyzer"] = function() end, -- using rustaceanvim
			["ts_ls"] = function() end, -- using typescript-tools
		})

		-- setup lsp per languages
		local servers = {
			"lua_ls",
			"pyright",
			-- "ts_ls",
		}

		for _, server in ipairs(servers) do
			local ok, config = pcall(require, "plugins.lsp.configs." .. server)
			if ok then
				config.setup_lsp(lspconfig, capabilities)
			end
		end
	end,
}
