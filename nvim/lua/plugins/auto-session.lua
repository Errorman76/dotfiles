return {
  "rmagatti/auto-session",
  keys = {
    { "<leader>sr", "<cmd>SessionRestore<CR>", "n" },
    { "<leader>ss", "<cmd>SessionSave<CR>", "n" },
  },
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
    })
  end,
}
