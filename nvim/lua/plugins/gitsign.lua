return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Actions
	      -- stylua: ignore start
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "preview hunk" })
				map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, { desc = "blame line" })
				map("n", "<leader>ht", gitsigns.toggle_current_line_blame, { desc = "toggle blame lens" })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = "git diff" })
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "git diff with previous commit" })
				-- stylua: ignore end
			end,
		})
	end,
}
