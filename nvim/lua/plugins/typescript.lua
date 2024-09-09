return {
	{
		"dmmulroy/tsc.nvim",
		enabled = false,
		config = function()
			require("tsc").setup({
				use_trouble_qflist = true,
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
