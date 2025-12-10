# Notes `nvim`

## Listen all `nvim` events

```lua
for _, value in ipairs(vim.api.nvim_get_autocmds({})) do
  table.insert(events, value.event)
end

vim.api.nvim_create_autocmd(events, {
  callback = function(args)
    print(args.event)
  end,
})
```
