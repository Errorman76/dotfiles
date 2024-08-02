return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jay-babu/mason-nvim-dap.nvim",
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

		require("mason-nvim-dap").setup({
			ensure_installed = {
				-- javascript
				"js",

				-- python
				"python",

				-- rust
				"codelldb",
			},
		})
	end,
}
