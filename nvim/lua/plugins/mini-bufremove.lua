return {
	"echasnovski/mini.bufremove",
	version = "*",
	keys = {
		{
			"<leader>c",
			function()
				require("mini.bufremove").delete()
			end,
			"n",
			desc = "close buffer",
		},
		{
			"<leader>C",
			function()
				local current_buf = vim.api.nvim_get_current_buf()
				local buffers = vim.fn.getbufinfo({ buflisted = 1 })

				for _, buf in ipairs(buffers) do
					if buf.bufnr ~= current_buf then
						require("mini.bufremove").delete(buf.bufnr, false)
					end
				end
			end,
			"n",
			desc = "close other buffers",
		},
	},
	config = function()
		require("mini.bufremove").setup()
	end,
}
