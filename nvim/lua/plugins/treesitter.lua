return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"lua",
				"bash",
				"python",
				"rust",
				"go",

				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",

				"markdown",
				"markdown_inline",

				"vim",
				"yaml",
				"toml",
				"json",
				"vimdoc",

				"dockerfile",
				"gitignore",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
