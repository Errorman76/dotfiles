return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- lua
          "lua_ls",

          -- frontend
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "jsonls",

          -- python
          "pyright",

          -- go
          -- "gopls",

          -- rust
          "rust_analyzer",

          -- rust
          -- "nginx_language_server",

          -- etc
          "dockerls",
          "taplo",
          -- "yamllsk"
        }
      })  
    end
  },
  {
    "neovim/nvim-lspconfig",
  }
}
