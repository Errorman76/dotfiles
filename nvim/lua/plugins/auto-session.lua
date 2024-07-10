return {
  "rmagatti/auto-session",
  dependencies = {
    'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
  },
  keys = {
    { "<leader>sr", "<cmd>SessionRestore<CR>", "n", desc = "restore session" },
    { "<leader>ss", "<cmd>SessionSave<CR>", "n", desc = "save session" },
  },
  config = function()
    require("auto-session").setup({
      auto_restore_enabled = false,
    })
  end,
}
