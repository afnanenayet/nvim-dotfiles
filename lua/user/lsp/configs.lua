local lsp_custom_plugins = require("user.lsp.plugins.init")
local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end
-- This must be set up before LSP
require("neodev").setup({})
local lspconfig = require("lspconfig")

local servers = {
	"jsonls",
	"hls",
	"taplo",
	"html",
	"pylsp",
	"bashls",
	"cmake",
	"rnix",
	"lua_ls",
}

for _, server in ipairs(servers) do
	for _, plugin_server in ipairs(lsp_custom_plugins.servers) do
		if plugin_server == server then
			error("You cannot set up a custom plugin and a standard LSPconfig: " .. server)
		end
	end
end

lsp_installer.setup({
	automatic_installation = { exclude = { "hls", "texlab" } },
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
