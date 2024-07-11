-- if true then return {} end
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
