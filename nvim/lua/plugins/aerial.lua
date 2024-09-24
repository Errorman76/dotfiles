return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
    -- stylua: ignore start
    {"<leader>lo", "<cmd>AerialToggle!<CR>", "n", desc = "symbol outline"},
    {"{", "<cmd>AerialPrev<CR>", "n", desc = "previous symbol"},
    {"}", "<cmd>AerialNext<CR>", "n", desc = "next symbol"},
		-- stylua: ignore end
	},
	config = function()
		require("aerial").setup()
	end,
}
