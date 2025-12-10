---@type LazySpec
return {
  -- NOTE: Ensure install `rust-analyzer` in `mason`
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = { "rust-analyzer" },
    },
  },

  -- NOTE: Using custom hotkeys to stronger usage `rust`
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    init = function(_)
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, buffnr)
            local wk = require("which-key")
            local icon, hl = require("mini.icons").get("file", ".rs")

            wk.add({
              {
                mode = "n",
                buffer = buffnr,
                { "<leader>c<leader>m", group = "macros", icon = { icon = icon, hl = hl }, noremap = true },
                {
                  "<leader>c<leader>me",
                  function()
                    vim.cmd.RustLsp("expandMacro")
                  end,
                  desc = "Expand macro",
                  icon = { icon = icon, hl = hl },
                  noremap = true,
                },
              },
            })
          end,
        },
      }
    end,
  },
}
