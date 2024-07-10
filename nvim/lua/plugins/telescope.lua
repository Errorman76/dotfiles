return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", "n", desc = "find file" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", "n", desc = "find string" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", "n", desc = "find current string" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", "n", desc = "find todo list" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    require('telescope').load_extension('fzy_native')
  end,
}
