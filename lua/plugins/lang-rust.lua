---@type LazySpec
return {
  {
    "mrcjkb/rustaceanvim",
    version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or "^6",
    init = function(_)
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, buffnr)
            local wk = require("which-key")
            local icon, hl = MiniIcons.get("file", ".rs")

            wk.add({
              {
                mode = "n",
                buffer = buffnr,
                { "<leader>cm", group = "macros", icon = { icon = icon, hl = hl }, noremap = true },
                {
                  "<leader>cme",
                  function()
                    vim.cmd.RustLsp("expandMacro")
                  end,
                  desc = "Expand macro",
                  icon = { icon = icon, hl = hl },
                  noremap = true,
                },
              },
            })

            -- vim.keymap.set("n", "<leader>cme", function()
            --   vim.cmd.RustLsp("expandMacro")
            -- end, { desc = "Expand macro", buffer = buffnr, noremap = true })
          end,
          default_settings = {
            ["rust-analyzer"] = {
              lru = {
                capacity = 44,
              },
              cachePriming = {
                enable = false,
              },
              procMacro = {
                ignored = {
                  ["async-trait"] = { "async_trait" },
                },
              },
            },
          },
        },
      }
    end,
  },
}
