return {
  "rmagatti/auto-session",
  keys = {
    { "<leader>sr", "<cmd>SessionRestore<CR>", "n", desc = "restore session" },
    { "<leader>ss", "<cmd>SessionSave<CR>", "n", desc = "save session" },
  },
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
    })
  end,
}
