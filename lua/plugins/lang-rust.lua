---@type LazySpec
return {
  -- NOTE: Using mason rust-analyzer
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

  -- NOTE: Uncomment this is needed warns `async_trait`
  -- {
  --   "mrcjkb/rustaceanvim",
  --   init = function(_)
  --     vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, {
  --       server = {
  --         default_settings = {
  --           ["rust-analyzer"] = {
  --             procMacro = {
  --               ignored = {
  --                 ["async-trait"] = { "async_trait" },
  --               },
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
