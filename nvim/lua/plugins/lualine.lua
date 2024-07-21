return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/lsp-status.nvim",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox",
        globalstatus = true,
      },
      sections = {
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
          {
            -- display all attahced clients
            function()
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return ''
              end

              local clients_list = {}
              for _, client in pairs(clients) do
                table.insert(clients_list, client.name)
              end

              return '\u{f085} ' .. table.concat(clients_list, "|")
            end
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
      },
    })
  end,
}
