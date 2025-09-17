-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "package.json", -- Указываем конкретное имя файла
  callback = function()
    -- Устанавливаем keymap только для package.json
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<leader>pp",
      "<cmd>lua require('package-info').change_version()<cr>",
      { noremap = true, silent = true, desc = "Install a different dependency version" }
    )
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".env.*" },
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.MD" },
  callback = function()
    vim.bo.filetype = "markdown"
  end,
})
