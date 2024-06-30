return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<Leader>e", ":Neotree filesystem toggle left<CR>", "n" },
    { "<Leader>o", ":Neotree focus<CR>", "n" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
    })
  end,
}

