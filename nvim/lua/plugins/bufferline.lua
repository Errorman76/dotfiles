return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            separator = true -- use a "true" to enable the default, or set your own character
          },
        },
      },
    })
  end,
}
