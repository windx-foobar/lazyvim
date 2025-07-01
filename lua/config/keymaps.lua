-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

vim.keymap.set("n", "<leader>b[", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to prev" })
vim.keymap.set("n", "<leader>b]", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to next" })
