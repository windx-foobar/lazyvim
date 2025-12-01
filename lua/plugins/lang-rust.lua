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

  {
    "mrcjkb/rustaceanvim",
    -- NOTE: Using latest changes from LazyVim/LazVim#main
    init = function(_)
      local exclude = {
        ".direnv",
        ".git",
        ".jj",
        ".github",
        ".gitlab",
        "bin",
        "node_modules",
        "target",
        "venv",
        ".venv",
      }

      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              files = {
                exclude = exclude,
                excludeDirs = exclude,
                -- Avoid Roots Scanned hanging, see https://github.com/rust-lang/rust-analyzer/issues/12613#issuecomment-2096386344
                watcher = "client",
              },
            },
          },
        },
      })
    end,
    -- NOTE: Avoid warnings `async_trait`
    opts = function(_, opts)
      opts = opts or {}
      local local_opts = opts
      local path = { "server", "default_settings", "rust-analyzer", "procMacro", "ignored" }

      for i = 1, #path - 1 do
        local_opts[path[i]] = local_opts[path[i]] or {}
        local_opts = local_opts[path[i]]
      end
      local_opts[path[#path]] = {
        ["napi-derive"] = { "napi" },
        ["async-recursion"] = { "async_recursion" },
      }

      return opts
    end,
  },
}
