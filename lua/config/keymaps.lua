-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>b[", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to prev" })
vim.keymap.set("n", "<leader>b]", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to next" })
