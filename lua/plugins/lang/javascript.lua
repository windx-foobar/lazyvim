---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        settings = {
          rulesCustomizations = {
            { rule = "curly", severity = "off" },
          },
        },
      },

      vtsls = {
        settings = {
          javascript = {
            suggestionActions = false,
          },
        },
      },
    },
  },
}
