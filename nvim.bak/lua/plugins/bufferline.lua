return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
					},
				},
			},
		})
	end,
}
