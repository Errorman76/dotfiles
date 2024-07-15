return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<Leader>e", ":Neotree filesystem toggle left<CR>", "n", desc = "toggle neotree" },
    { "<Leader>o", ":Neotree focus<CR>", "n", desc = "focus neotree" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
    })
  end,
}

