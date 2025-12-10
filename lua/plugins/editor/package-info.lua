---@type LazySpec
return {
  --- NOTE: Change and check newest version in `package.json`
  "vuki656/package-info.nvim",
  opts = {},
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "package.json",
      callback = function(args)
        local wk = require("which-key")
        local icon, hl = require("mini.icons").get("file", "package.json")

        wk.add({
          {
            mode = "n",
            buffer = args.buf,
            { "<leader>c<leader>p", group = "package-info", icon = { icon = icon, hl = hl }, noremap = true },
            {
              "<leader>c<leader>pi",
              function()
                require("package-info").change_version()
              end,
              desc = "Install a different dependency version",
              icon = { icon = icon, hl = hl },
              noremap = true,
            },
            {
              "<leader>c<leader>pu",
              function()
                require("package-info").update()
              end,
              desc = "Update dependency version",
              icon = { icon = icon, hl = hl },
              noremap = true,
            },
          },
        })
      end,
    })
  end,
}
