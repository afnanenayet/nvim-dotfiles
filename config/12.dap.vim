lua <<EOF
local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end

dap_install.setup({ installation_path = vim.fn.stdpath("data") .. "/dapinstall/", })

require("nvim-dap-virtual-text").setup()
require('telescope').load_extension('dap')
EOF
