return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, "n", desc = "next todo comments" },
    { "[t", function() require("todo-comments").jump_prev() end, "n", desc = "previous todo comments" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", "n", desc = "find todo list" },
  },
  config = function()
    require("todo-comments").setup()
  end
}
