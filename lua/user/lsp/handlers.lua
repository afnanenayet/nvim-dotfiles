local M = {}

-- Configure LSP hover with vertical padding to match rustaceanvim
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "solid",
	pad_top = 1,
	pad_bottom = 1,
})

-- Fix floating window highlights for rustaceanvim and other plugins
-- that use markdown floating windows
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(args)
		local win = vim.fn.bufwinid(args.buf)
		if win ~= -1 then
			local win_config = vim.api.nvim_win_get_config(win)
			if win_config.relative ~= "" then
				-- This is a floating window, apply NormalFloat highlight
				vim.wo[win].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"
			end
		end
	end,
})

local function lsp_keymaps(bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end
  -- Navigation handled by Snacks picker (gd, gI, gy, gr) in ui.lua
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  map("n", "gl", function()
    vim.diagnostic.open_float({ border = "solid" })
  end, "Show diagnostic")
end

M.on_attach = function(client, bufnr)
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end
  lsp_keymaps(bufnr)
  vim.api.nvim_set_option_value("formatexpr", "v:lua.vim.lsp.formatexpr(#{timeout_ms:250})", { buf = bufnr })
  if client.server_capabilities.documentSymbolProvider then
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
return M
