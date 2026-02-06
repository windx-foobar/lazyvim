---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "xmlformatter" },
    },
  },
  {
    "conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.xml = { "xmlformatter", lsp_format = "fallback" }
    end,
  },
}
