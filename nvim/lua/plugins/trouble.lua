return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{ "<leader>lx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
	},
	config = function()
		require("trouble").setup({
			preview = {
				scratch = false,
			},
		})
	end,
}
