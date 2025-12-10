return {
  -- NOTE: Load `colorscheme` plugins
  require("plugins.colorscheme.vscode"),

  -- NOTE: Configure LazyVim to load `vim.g.colorscheme` theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = vim.g.colorscheme,
    },
  },
}
