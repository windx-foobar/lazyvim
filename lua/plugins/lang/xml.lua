---@type LazySpec
return {
  -- NOTE: Install `lsp` server from `mason`
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "xmlformatter" },
    },
  },

  -- NOTE: Add `xml` in treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "xml" } },
  },

  -- NOTE: Add `xmlformatter` to conform
  {
    "conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.xml = { "xmlformatter", lsp_format = "fallback" }
    end,
  },
}
