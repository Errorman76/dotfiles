return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/lsp-status.nvim",
	},
	config = function()
		local utils_status = require("utils.status")

		require("lualine").setup({
			options = {
				theme = "gruvbox",
				globalstatus = true,
			},
			sections = {
				lualine_c = {
					{ "filename" },
					{ "aerial" },
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "#ff9e64" },
					},
					{
						utils_status.get_attached_clients,
					},
					{
						utils_status.get_attached_formatters,
					},
					{
						utils_status.get_attached_linters,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
