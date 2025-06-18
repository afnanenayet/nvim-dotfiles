-- Set up rust tools
local config_utils = require("user.lsp.settings.utils")
local rt = require("rust-tools")
local rt_dap = require("rust-tools.dap")

local M = {}

function M.server_name()
	return "rust_analyzer"
end

function M.setup()
	local server_opts = {
		on_attach = function(client, bufnr)
			require("user.lsp.handlers").on_attach(client, bufnr)
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>:RustCodeAction<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>:RustHoverActions<CR>", opts)
		end,
		standalone = false,
		inlayHints = { locationLinks = false },
	}
	local _, server_custom_opts = config_utils.get_custom_opts(M.server_name())
	server_opts = vim.tbl_deep_extend("force", server_custom_opts, server_opts)
	local mason_install_dir = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason")
	local opts = {
		server = server_opts,
		tools = { -- rust-tools options
			inlay_hints = {
				-- automatically set inlay hints (type hints)
				-- default: true
				auto = false,
			},
		},

		dap = {
			adapter = rt_dap.get_codelldb_adapter(
				vim.fn.resolve(mason_install_dir .. "/packages/codelldb/adapter/codelldb"),
				vim.fn.resolve(mason_install_dir .. "/packages/codelldb/extension/lldb/lib/liblldb.dylib")
			),
		},
	}
	-- This plugin handles registering the rust_analyzer LSP
	rt.setup(opts)
end

return M
