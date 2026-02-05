-- LuaSnip session management
-- Unlink snippet nodes when leaving insert mode to prevent jumping back to old snippets
local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then
  return
end

local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group = unlinkgrp,
  pattern = { "s:n", "i:*" },
  desc = "Forget the current snippet when leaving insert mode",
  callback = function(evt)
    while luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active do
      luasnip.unlink_current()
    end
  end,
})
