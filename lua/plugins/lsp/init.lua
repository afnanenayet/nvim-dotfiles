return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = { preset = "classic" },
	},
	{
		"folke/neoconf.nvim",
		config = true,
		lazy = false,
	},
	{
		"Civitasv/cmake-tools.nvim",
		opts = {},
		lazy = true,
		ft = { "cpp", "cmake" },
	},
	{
		-- Setup code mostly taken from: https://github.com/mrcjkb/haskell-tools.nvim
		"mrcjkb/haskell-tools.nvim",
		version = "^4", -- Recommended
		ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
		lazy = false, -- Plugin is already lazy
		config = function()
			vim.g.haskell_tools = {
				hls = {
					on_attach = function(client, bufnr)
						require("user.lsp.handlers").on_attach(client, bufnr)
					end,
				},
			}
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		version = "^6",
		ft = { "rust" },
		lazy = false,
		-- priority = 500,
		init = function()
			vim.g.rustaceanvim = {
				tools = {
					-- Clippy can add a lot of delay.
					enable_clippy = false,
					float_win_config = {
						border = "solid",
					},
				},
				-- LSP configuration
				server = {
					on_attach = function(client, bufnr)
						require("user.lsp.handlers").on_attach(client, bufnr)
						local keymap_opts = { noremap = true, silent = true }
						vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", ":RustLsp codeAction<cr>", keymap_opts)
						vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":RustLsp hover actions<cr>", keymap_opts)
					end,
					---@param project_root string Path to the project root
					settings = function(project_root)
						local ra = require("rustaceanvim.config.server")
						return ra.load_rust_analyzer_settings(project_root, {
							settings_file_pattern = "rust-analyzer.json",
						})
					end,
				},
			}
		end,
	},
	-- optional `vim.uv` typings
	{ "Bilal2453/luvit-meta", lazy = true },
	-- lspconfig
	{
		"mason-org/mason.nvim",
		config = true,
		keys = {
			{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = {
			automatic_enable = {
				exclude = { "rust_analyzer" },
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		event = "VeryLazy",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mfussenegger/nvim-dap",
			"p00f/clangd_extensions.nvim",
			"saghen/blink.cmp",
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
		},
		---@class PluginLspOpts
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				severity_sort = true,
				virtual_text = false,
				update_in_insert = true,
				underline = true,
				-- not using in favor of tiny-inline-diagnostic
				-- virtual_lines = { current_line = true },
				float = {
					focusable = false,
					style = "minimal",
					source = "always",
					header = "",
					prefix = "",
				},

				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
					},
					linehl = {
						[vim.diagnostic.severity.ERROR] = "Error",
						[vim.diagnostic.severity.WARN] = "Warn",
						[vim.diagnostic.severity.INFO] = "Info",
						[vim.diagnostic.severity.HINT] = "Hint",
					},
				},
			},
			document_highlight = {
				enabled = true,
			},
			codelens = {
				enabled = true,
			},
			-- LSP Server Settings
			---@type lspconfig.options
			servers = {
				wgsl_analyzer = {
					settings = {
						["wgsl-analyzer"] = {},
					},
					handlers = {
						["wgsl-analyzer/requestConfiguration"] = function()
							return {
								success = true,
								customImports = { _dummy_ = "dummy" },
								shaderDefs = {},
								trace = {
									extension = false,
									server = false,
								},
								inlayHints = {
									enabled = true,
									typeHints = true,
									parameterHints = true,
									structLayoutHints = true,
									typeVerbosity = "inner",
								},
								diagnostics = {
									typeErrors = true,
									nagaParsingErrors = true,
									nagaValidationErrors = true,
									nagaVersion = "main",
								},
							}
						end,
					},
				},
				texlab = {},
				marksman = {},
				bashls = {},
				jsonls = {},
				taplo = {},
				cmake = {},
				rnix = {},
				hls = { mason = false },
				basedpyright = {},
				html = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				clangd = function(_, _)
					local clangd = require("clangd_extensions")
					clangd.setup()
					return false
				end,
				rust_analyzer = function(_, _)
					return true
				end,
				hls = function(_, _)
					return true
				end,
			},
		},
		---@param opts PluginLspOpts
		---@diagnostic disable-next-line: unused-local
		config = function(plugin, opts)
			vim.diagnostic.config(opts.diagnostics)
			local servers = opts.servers
			local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
					on_attach = require("user.lsp.handlers").on_attach,
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				vim.lsp.config(server, server_opts)
				vim.lsp.enable(server)
			end

			local mlsp = require("mason-lspconfig")
			local available = mlsp.get_available_servers()
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(available, server) then
						setup(server)
					end
				end
			end
		end,
	},

	-- Formatting used to be handled by null-s, which is no longer maintained
	{
		"stevearc/conform.nvim",
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				python = { "isort", "black" },
				yaml = { "prettier" },
			},
		},
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>lf",
				function()
					require("conform").format({ async = false, lsp_fallback = true })
				end,
				mode = "n",
				desc = "Format buffer",
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},

	-- cmdline tools and lsp servers
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
				"rust-analyzer",
				"clangd",
				"bash-language-server",
				"basedpyright",
			},
		},
		---@diagnostic disable-next-line: undefined-doc-name, unused-local
		config = function(plugin, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = true,
	},
}
