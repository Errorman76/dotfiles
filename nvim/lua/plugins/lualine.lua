return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "arkav/lualine-lsp-progress",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox",
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          { "filename" },
          { "lsp_progress" },
        },
      },
    })
  end,
}
