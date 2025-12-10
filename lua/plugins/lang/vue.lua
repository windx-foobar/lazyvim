local util = require("lspconfig.util")

---@type LazySpec
return {
  -- NOTE: Required lazyvim extras `lang.vue`
  { import = "lazyvim.plugins.extras.lang.vue" },

  -- NOTE: Swap `vue-language-server` to v2
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if vim.g.vuejs_version ~= 2 then
        return
      end

      return vim.tbl_deep_extend("force", opts, {
        servers = {
          vue_ls = {
            cmd = {
              vim.fn.stdpath("config") .. "/extra/lsp/vue2-language-server/node_modules/.bin/vue-language-server",
              "--stdio",
            },
            init_options = {
              typescript = {
                tsdk = util.get_typescript_server_path(vim.fn.stdpath("data") .. "/mason/packages/vue-language-server"),
              },
            },
          },
        },
      })
    end,
  },

  -- NOTE: Swap `@vue/typescript-plugin` from `vue-language-server` v2
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if vim.g.vuejs_version ~= 2 then
        return
      end

      for _, value in ipairs(opts.servers.vtsls.settings.vtsls.tsserver.globalPlugins) do
        if value.name == "@vue/typescript-plugin" then
          value.location = vim.fn.stdpath("config") .. "/extra/lsp/vue2-language-server"
        end
      end
    end,
  },
}
