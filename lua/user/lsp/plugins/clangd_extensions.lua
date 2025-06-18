-- Sets up clangd_extensions for LSP

local config_utils = require("user.lsp.settings.utils")
local clangd_extensions = require("clangd_extensions")

local M = {}

-- Return the server name that this module sets up.
function M.server_name()
	return "clangd"
end

function M.setup()
	local _, server_custom_opts = config_utils.get_custom_opts(M.server_name())
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	clangd_extensions.setup({
		server = opts,
	})
end

return M
