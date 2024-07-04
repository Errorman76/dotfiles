return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets", -- snippet collection
    "onsails/lspkind.nvim", -- vscode style snippet
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load() -- load friendly-snippets

    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<S-tab>"] = cmp.mapping.select_prev_item(),
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
        }),
      },
    })

    -- Loop through the servers and set up each one with the same capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_servers = require("mason-lspconfig").get_installed_servers()
    local lspconfig = require("lspconfig")

    for _, lsp in ipairs(lsp_servers) do
      lspconfig[lsp].setup {
        capabilities = capabilities
      }
    end

  end,
}
