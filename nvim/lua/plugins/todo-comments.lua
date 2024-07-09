return {
  "folke/todo-comments.nvim",
  event = { "VimEnter" },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, "n", desc = "next todo comments" },
    { "[t", function() require("todo-comments").jump_prev() end, "n", desc = "previous todo comments" },
  },
  config = function()
    require("todo-comments").setup()
  end
}
