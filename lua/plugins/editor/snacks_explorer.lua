---@type LazySpec
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        ---@type snacks.picker.explorer.Config
        explorer = {
          ignored = false,
          hidden = true,
        },
      },
    },
  },
}
