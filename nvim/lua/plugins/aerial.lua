return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
    -- stylua: ignore start
    {"<leader>a", "<cmd>AerialToggle!<CR>", "n", desc = "togle symbol outline"},
    {"{", "<cmd>AerialPrev<CR>", "n", desc = "previous symbol"},
    {"}", "<cmd>AerialNext<CR>", "n", desc = "next symbol"},
		-- stylua: ignore end
	},
	config = function()
		-- TODO: extend symbol detection level
		require("aerial").setup()
	end,
}