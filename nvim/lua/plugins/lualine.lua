return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/lsp-status.nvim",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox",
				globalstatus = true,
			},
			sections = {
				lualine_c = {
					{ "filename" },
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_x = {
					{
						require("core.utils").get_attached_clients,
					},
					{
						require("core.utils").get_attached_formatters,
					},
					{
						require("core.utils").get_attached_linters,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
