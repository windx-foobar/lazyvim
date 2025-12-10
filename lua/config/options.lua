-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

_G.WindxVim = require("util")

LazyVim.terminal.setup("zsh") -- default: bash
vim.g.colorscheme = "vscode" -- default: "tokyonight"
vim.g.vuejs_version = vim.g.vuejs_version or 3 -- custom
