return {
	"mrjones2014/smart-splits.nvim",
	keys = {
		{
			"<A-Up>",
			function()
				require("smart-splits").resize_up()
			end,
			"n",
			desc = "resize window(up)",
		},
		{
			"<A-Down>",
			function()
				require("smart-splits").resize_down()
			end,
			"n",
			desc = "resize window(down)",
		},
		{
			"<A-Left>",
			function()
				require("smart-splits").resize_left()
			end,
			"n",
			desc = "resize window(left)",
		},
		{
			"<A-Right>",
			function()
				require("smart-splits").resize_right()
			end,
			"n",
			desc = "resize window(right)",
		},
	},
}
