local M = {}

local function lsp_keymaps(bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end
  -- Navigation handled by Snacks picker (gd, gI, gy, gr) in ui.lua
  -- K, [d, ]d are Neovim 0.11+ defaults; not redefined here
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
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
