return {
  "folke/todo-comments.nvim",
  event = { "VimEnter" },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, "n" },
    { "[t", function() require("todo-comments").jump_prev() end, "n" },
  }, 
  config = function()
    require("todo-comments").setup()
  end
}
