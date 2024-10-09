return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{ "<leader>lx", "<cmd>Trouble diagnostics toggle<cr>", desc = "toggle diagnostics (with trouble)" },
	},
	config = function()
		require("trouble").setup({
			preview = {
				scratch = false,
			},
		})
	end,
}
