-- Utilities for dealing with custom options.

local M = {}

-- Returns server options if there are any for the given server. If there are
-- not, this returns an empty table.
function M.get_custom_opts(server_name)
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server_name)
	if not has_custom_opts then
		return has_custom_opts, {}
	else
		return has_custom_opts, server_custom_opts
	end
end

return M
