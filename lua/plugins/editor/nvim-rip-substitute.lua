---@type LazySpec
return {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  commit = "808f2531",
  pin = true,
  opts = {},
  keys = {
    {
      "<leader>fs",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = " rip substitute",
    },
  },
}
