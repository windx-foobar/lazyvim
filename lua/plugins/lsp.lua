local base_config = require("lazyvim.plugins.lsp")

---@class NewPluginLspOpts: PluginLspOpts
---@field folds { enabled: boolean, ignore_filetypes?: string[] }

local M = {}

function M.find_config()
  for _, value in ipairs(base_config) do
    if vim.tbl_contains(value, "neovim/nvim-lspconfig") then
      return value
    end
  end
end

M.find_config = LazyVim.memoize(M.find_config)

---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  opts = {
    folds = {
      enabled = true,
      ignore_filetypes = { "scss" },
    },
  },
  ---@param opts NewPluginLspOpts
  config = function(self, opts)
    M.find_config().config(self, vim.tbl_deep_extend("force", opts, { folds = { enabled = false } }))

    -- folds
    if opts.folds.enabled then
      Snacks.util.lsp.on({ method = "textDocument/foldingRange" }, function(_, client)
        local filetypes = client.config.filetypes or {}

        for _, filetype in ipairs(filetypes) do
          if vim.tbl_contains(opts.folds.ignore_filetypes or {}, filetype) then
            return
          end
        end

        if LazyVim.set_default("foldmethod", "expr") then
          LazyVim.set_default("foldexpr", "v:lua.vim.lsp.foldexpr()")
        end
      end)
    end
  end,
}
