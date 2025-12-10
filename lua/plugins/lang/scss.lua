---@type LazySpec
return {
  -- NOTE: Install `lsp` server from `mason`
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "some-sass-language-server" },
    },
  },

  -- NOTE: Register `lsp` server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        somesass_ls = {},
      },
    },
  },

  -- NOTE: Add `sass/scss` in treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "scss" } },
  },
}
