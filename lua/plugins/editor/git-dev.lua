---@type LazySpec
return {
  "moyiz/git-dev.nvim",
  event = "VeryLazy",
  opts = {},
  init = function()
    vim.api.nvim_create_autocmd("UIEnter", {
      callback = function(args)
        local wk = require("which-key")
        local icon, hl = require("mini.icons").get("file", ".gitkeep")

        wk.add({
          {
            mode = "n",
            buffer = args.buf,
            { "<leader>g<leader>d", group = "git-dev", icon = { icon = icon, hl = hl }, noremap = true },
            {
              "<leader>g<leader>do",
              function()
                WindxVim.git_dev.open()
              end,
              desc = "Open repository",
              icon = { icon = icon, hl = hl },
              noremap = true,
            },
          },
        })
      end,
    })
  end,
}
