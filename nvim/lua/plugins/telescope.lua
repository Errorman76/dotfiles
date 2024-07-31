return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- telescope with fzf
		"nvim-telescope/telescope-ui-select.nvim", -- change nvim select ui, like telescope
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", "n", desc = "find file" },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", "n", desc = "find string" },
		{ "<leader>fw", "<cmd>Telescope live_grep<cr>", "n", desc = "find current string" },
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
