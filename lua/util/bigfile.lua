local M = {}

--- @param filetype string?
--- @param buf integer?
function M.disable(filetype, buf)
  buf = buf or vim.api.nvim_get_current_buf()

  if vim.bo[buf].filetype ~= "bigfile" then
    LazyVim.warn("This buffer is not `bigfile` ft.", { title = "WindxVim.bigfile" })
    return
  end

  if filetype == nil or filetype == "" then
    Snacks.input.input({ prompt = "Input buffer filetype" }, function(value)
      if value ~= "" and value ~= nil then
        M.disable(value, buf)
      end
    end)
    return
  end

  vim.bo[buf].filetype = filetype
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "v:lua.LazyVim.treesitter.foldexpr()"
end

function M.setup()
  vim.api.nvim_create_user_command("WindxVimBigFileDisable", function()
    WindxVim.bigfile.disable()
  end, {})

  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = vim.api.nvim_create_augroup("windxvim_bigfile", { clear = true }),
    callback = function(ev)
      if vim.bo[ev.buf].filetype ~= "bigfile" then
        return false
      end

      local wk = require("which-key")
      local icon, hl = require("mini.icons").get("file", ".txt")

      wk.add({
        {
          mode = "n",
          buffer = ev.buf,
          {
            "<leader>cdb",
            M.disable,
            desc = "Disable fck**ing bigfile",
            icon = { icon = icon, hl = hl },
            noremap = true,
          },
        },
      })

      return true
    end,
  })
end

return M
