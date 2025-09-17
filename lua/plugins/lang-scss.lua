---@type LazySpec
return {
  -- Register LSP
  {
    "nvim-lspconfig/nvim-lspconfig",
    opts = {
      servers = {
        somesass_ls = {},
      },
    },
  },

  -- Install LSP from Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "some-sass-language-server" },
    },
  },

  -- Add SASS/SCSS to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "scss" } },
  },
}
