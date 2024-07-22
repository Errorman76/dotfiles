return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        markdown = { "prettier" },

        sh = { "shfmt" },
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports_reviser", "gofmt", "golines" },

        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },

        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },

        yaml = { "prettier" },
        toml = { "taplo" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    })
  end,
}
