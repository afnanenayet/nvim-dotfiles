local M = {}

local function lsp_keymaps(bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end
  -- Navigation handled by Snacks picker (gd, gI, gy, gr) in ui.lua
  -- K, [d, ]d are Neovim 0.11+ defaults; not redefined here
  -- grr/gri/grt/gO -> Trouble, set globally in user/keymaps.lua (not buffer-local: they
  -- have no non-LSP meaning to preserve). gD keeps its buffer-local scope so Vim's native
  -- "go to global declaration" motion still works outside LSP-attached buffers.
  map("n", "gD", "<cmd>Trouble lsp_declarations toggle<cr>", "Go to declaration (Trouble)")
  map("n", "gl", function()
    vim.diagnostic.open_float({ border = "solid" })
  end, "Show diagnostic")
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client.server_capabilities.documentSymbolProvider then
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)
  end
end

return M
