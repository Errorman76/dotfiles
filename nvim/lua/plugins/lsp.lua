return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				-- bash
				"bashls",

				-- lua
				"lua_ls",

				-- frontend
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"jsonls",

				-- python
				"pyright",

				-- go
				-- "gopls",

				-- rust
				"rust_analyzer",

				-- nginx
				-- "nginx_language_server",

				-- etc
				"dockerls",
				"taplo",
				-- "yamllsk"
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- formatter
				"prettier",
				"black",
				"isort",
				"shfmt",
				"stylua",

				-- linter
				"eslint_d",
				"pylint",
			},
		})

		-- The servers and set up each one with the same capabilities
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				})
			end,
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			end,
		})
	end,
}
