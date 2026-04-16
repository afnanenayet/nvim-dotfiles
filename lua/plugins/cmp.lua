return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		event = "VeryLazy",
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				"luvit-meta/library",
				"lazy.nvim",
				{ path = "blink.cmp", words = { "blink%.cmp" } },
				{ path = "snacks.nvim", words = { "snacks%." } },
				{ path = "flash.nvim", words = { "Flash%." } },
				{ path = "nvim-lspconfig", words = { "lspconfig%." } },
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "v1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
			"xzbdmw/colorful-menu.nvim",
			"onsails/lspkind.nvim",
		},
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			snippets = { preset = "luasnip" },
			appearance = {
				nerd_font_variant = "normal",
			},
			signature = { enabled = false },
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				ghost_text = { enabled = false },
				menu = {
					draw = {
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									return require("lspkind").symbol_map[ctx.kind] or ""
								end,
							},
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
}
