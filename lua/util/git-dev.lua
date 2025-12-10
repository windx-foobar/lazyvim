local M = {}

---@param name string?
function M.open(name)
  if name == nil or name == "" then
    Snacks.input.input({ prompt = "Github project name" }, function(value)
      if value ~= "" and value ~= nil then
        M.open(value)
      end
    end)
    return
  end

  vim.cmd(string.format("GitDevOpen %s", name))
end

return M
