local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local unlinkgrp = vim.api.nvim_create_augroup(
  'unlinksnippetonmodechange',
  { clear = true }
)

vim.api.nvim_create_autocmd("modechanged", {
  group = unlinkgrp,
  pattern = { "s:n", "i:*" },
  desc = "forget the current snippet when leaving the insert mode",
  callback = function(evt)
    -- if we have n active nodes, n - 1 will still remain after a `unlink_current()` call.
    -- we unlink all of them by wrapping the calls in a loop.
    while true do
      if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
        luasnip.unlink_current()
      else
        break
      end
    end
  end,
})
