---@type LazySpec
return {
  {
    "mrcjkb/rustaceanvim",
    version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or "^6",
    init = function(_)
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, buffnr)
            vim.keymap.set("n", "<leader>cm", function()
              vim.cmd.RustLsp("expandMacro")
            end, { desc = "Expand macro", buffer = buffnr, noremap = true })
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
