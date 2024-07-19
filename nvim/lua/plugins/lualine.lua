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

            -- Display only the lsp clients associated with the current buffer
            -- function ()
            --   local clients = vim.lsp.buf_get_clients(vim.api.nvim_get_current_buf())
            --   if next(clients) == nil then
            --     return ''
            --   end
            --
            --   local c = {}
            --   for _, client in pairs(clients) do
            --     table.insert(c, client.name)
            --   end
            --   return '\u{f085} ' .. table.concat(c, '|')
            -- end
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
      },
    })
  end,
}
