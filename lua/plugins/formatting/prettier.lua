local M = {}

---@param ctx ConformCtx
---@return nil|string
M.get_config_with_default = function(ctx)
  local result = vim.fn.system({ "prettier", "--find-config-path", ctx.filename })

  if vim.v.shell_error then
    local prettierrc_path = vim.fn.stdpath("config") .. "/extra/prettierrc.json"

    return io.open(prettierrc_path, "r") and prettierrc_path or nil
  else
    return result
  end
end

M.get_config_with_default = LazyVim.memoize(M.get_config_with_default)

---@type LazySpec
return {
  --- NOTE: Use extra default `config` prettier when config not passed in `project`
  {
    "stevearc/conform.nvim",
    optional = true,
    ---@param opts ConformOpts
    opts = function(_, opts)
      if opts.formatters.prettier then
        opts.formatters.prettier = vim.tbl_deep_extend("force", opts.formatters.prettier, {
          condition = function(_, _)
            return true
          end,
          append_args = function(_, ctx)
            local path = M.get_config_with_default(ctx)

            return path and { "--config", path } or {}
          end,
        })
      end
    end,
  },
}
