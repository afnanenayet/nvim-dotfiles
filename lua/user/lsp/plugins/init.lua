-- An entry point for the plugins module. Here we define settings for LSP
-- setup plugins that offer more functionality than the standard LSP setup.

require("user.lsp.plugins.rust_tools")
local M = {}

-- All of the plugins we want to iterate over
local all_modules = { "user.lsp.plugins.clangd_extensions", "user.lsp.plugins.rust_tools" }

-- All of the servers that are set up with custom plugins.
M.servers = {}

function M.setup()
	for _, mod_name in ipairs(all_modules) do
		local has_mod, module = pcall(require, mod_name)
    if not has_mod then
      error("Could not load module " .. mod_name)
    end
		module.setup()
		table.insert(M.servers, module.server_name())
	end
end

return M
