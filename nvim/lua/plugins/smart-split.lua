return {
  'mrjones2014/smart-splits.nvim',
  keys = {
    { "<A-Up>", function() require("smart-splits").resize_up() end, "n" },
    { "<A-Down>", function() require("smart-splits").resize_down() end, "n" },
    { "<A-Left>", function() require("smart-splits").resize_left() end, "n" },
    { "<A-Right>", function() require("smart-splits").resize_right() end, "n" },
  },
}
