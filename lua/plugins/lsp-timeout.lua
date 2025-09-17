---@type LazySpec
return {
  {
    "hinell/lsp-timeout.nvim",
    enabled = false,
    dependencies = { "neovim/nvim-lspconfig" },
    init = function(_)
      vim.g.lspTimeoutConfig = {
        stopTimeout = 1000 * 10, -- 10 secs
        startTimeout = 1000, -- 1 sec
      }
    end,
  },
}
